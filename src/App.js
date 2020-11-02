import React, { Component } from "react";
import Papa from "papaparse";
import { HeaderContainer } from "./containers/header";
import { SelectInputContainer } from "./containers/selectInput";
import { Main } from "./components";
import { FileInput } from "./components";
import { SubmitButton } from "./components";
import * as Highcharts from "highcharts";
import HighchartsReact from "highcharts-react-official";
import axios from "axios";

//Packages to use
/*
https://www.npmjs.com/package/papaparse
https://styled-components.com/
*/

const GET_API_PATH = "http://localhost/php-test-covid/src/api/getData.php";
const POST_CSV_API_PATH =
  "http://localhost/php-test-covid/src/api/sendCsvData.php";

export default class App extends Component {
  state = {
    csvData: null,
    csvHeader: null,
    fieldData: [
      { field: "active", title: "Number of active COVID-19 cases" },
      { field: "cases", title: "Number of total cases of COVID-19" },
      { field: "rate", title: "Rate of cases of COVID-19" },
      { field: "new", title: "Total new cases of COVID-19" },
    ],
    fields: ["active", "cases", "rate", "new"],
    selectedField: "active",
    dbData: null,
  };

  // Parses the file being uploaded into JSON format. (Only accepts csv)
  showFile = (e) => {
    e.preventDefault();
    // Process of parsing file starts here.
    // header: true returns the header from the data
    // dynamicTyping: true returns number from csv to actual number and not string.
    Papa.parse(e.target.files[0], {
      complete: (results, file) => {
        this.setState({
          csvData: results.data,
          csvHeader: results.meta.fields,
        });
      },
      header: true,
      dynamicTyping: true,
    });
  };

  displayChart = (e) => {
    e.preventDefault();
    this.setState({ selectedField: e.target.value });
  };

  // Retrieves the data for the chart, will take in the selected field and the csv data for processing
  getChartData = (arrayOfData, selectedField) => {
    let chartData = [];

    // Loop through the csv data and returns an object of the selected field with LGADisplay as the name
    // If it is == 0, then there's no point displaying the data.
    // Number() is used to guarantee that the element we select must be a number, this is also a way to dynamically change the types of the data we received
    // Which in this case could be from the server-side.
    arrayOfData.forEach((element, index) => {
      if (element[selectedField] > 0) {
        chartData.push({
          name: element.LGADisplay,
          y: Number(element[selectedField]),
        });
      }
    });
    return chartData;
  };

  // Retrieves the chart title based on the fieldData state that is previously set.
  getChartTitle = (selectedField) => {
    let title;
    this.state.fieldData.forEach((element, index) => {
      if (selectedField === element.field) {
        title = element.title;
      }
    });
    return title;
  };

  // Calls in the API for the POST request
  sendDataToDb = async (event) => {
    event.preventDefault();
    this.setState({ dbData: null });
    if (this.state.csvData) {
      await axios({
        method: "POST",
        url: POST_CSV_API_PATH,
        data: this.state.csvData,
      }).then((result) => {
        console.log(result.data);
      });
    } else {
      console.error("No CSV file was uploaded in the form.");
    }
    // Each time the data has been set, the database is cleared from previous csv requests, so that indicates that we need to gather the newly updated data.
    await this.getDataFromDb();
  };

  // Calls in the API for the GET request
  getDataFromDb = async () => {
    await axios({
      method: "GET",
      url: GET_API_PATH,
    }).then((result) => {
      let dbData = [];
      let results = result.data.split("split");
      results.forEach((element) => {
        if (element) {
          dbData.push(JSON.parse(element));
        }
      });
      this.setState({ dbData });
    });
  };

  async componentDidMount() {
    await this.getDataFromDb();
  }

  render() {
    let selectInput;
    let chart;
    if (this.state.dbData) {
      selectInput = (
        <SelectInputContainer
          options={this.state.fields}
          changed={this.displayChart}
        />
      );
    }

    // If an option is selected and there's a csv file || Will update with SQL soon
    if (this.state.selectedField && this.state.dbData) {
      const chartData = this.getChartData(
        this.state.dbData,
        this.state.selectedField
      );
      const chartTitle = this.getChartTitle(this.state.selectedField);

      // After retrieving chart data, if there is no data (for example if there's 0 cases in COVID, then do not display chart)
      if (chartData.length > 0) {
        const options = {
          chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: "pie",
          },
          title: {
            text: chartTitle,
          },
          plotOptions: {
            pie: {
              allowPointSelect: true,
              cursor: "pointer",
              dataLabels: {
                enabled: true,
                format: "<b>{point.name}</b>: {point.y}",
              },
            },
          },
          series: [
            {
              name: "Case(s)",
              colorByPoint: true,
              data: chartData,
            },
          ],
        };
        chart = <HighchartsReact highcharts={Highcharts} options={options} />;
      } else {
        chart = (
          <div>
            The data has a total of 0 possible points to plot, which means that
            there are nothing to plot.
          </div>
        );
      }
    }

    return (
      <React.Fragment>
        <Main>
          <HeaderContainer>
            <form onSubmit={this.sendDataToDb}>
              <FileInput
                name="fileInput"
                labelContent="Upload the LGA CSV here"
                accept=".csv"
                onChange={this.showFile}
              />
              <SubmitButton
                type="submit"
                disabled={this.state.csvData ? false : true}
              >
                Submit File To Database
              </SubmitButton>
            </form>
          </HeaderContainer>
          <Main.Content>
            {selectInput}
            {chart}
          </Main.Content>
        </Main>
      </React.Fragment>
    );
  }
}
