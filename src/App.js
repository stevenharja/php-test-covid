import React, { Component } from "react";
import Papa from "papaparse";
import { HeaderContainer } from "./containers/header";
import { SelectInputContainer } from "./containers/selectInput";
import { Main, FileInput, SubmitButton, DataTable } from "./components";
import * as Highcharts from "highcharts";
import HighchartsReact from "highcharts-react-official";
import axios from "axios";

//Packages to use
/*
https://www.npmjs.com/package/papaparse
https://styled-components.com/
*/

// API links
const GET_API_PATH = "http://localhost/php-test-covid/src/api/getData.php";
const POST_CSV_API_PATH =
  "http://localhost/php-test-covid/src/api/sendCsvData.php";
const POST_SINGLE_DATA_PATH =
  "http://localhost/php-test-covid/src/api/updateSingleData.php";

export default class App extends Component {
  state = {
    csvData: null,
    fieldData: [
      { field: "active", title: "Number of active COVID-19 cases" },
      { field: "cases", title: "Number of total cases of COVID-19" },
      { field: "rate", title: "Rate of cases of COVID-19" },
      { field: "new", title: "Total new cases of COVID-19" },
    ],
    fields: ["active", "cases", "rate", "new"],
    selectedField: "active",
    dbData: null,
    dbHeader: null,
    useUploadedFile: false,
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
        });
      },
      header: true,
      dynamicTyping: true,
    });
  };

  // Function to display chart based on the dropdown menu supplied in the select container.
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
  sendDataToDb = async () => {
    this.setState({ dbData: null });
    if (this.state.csvData) {
      await axios({
        method: "POST",
        url: POST_CSV_API_PATH,
        data: this.state.csvData,
      }).then((result) => {});
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
      // Get all possible columns from the first element of the array.
      if (dbData.length) {
        const dbHeader = Object.keys(dbData[0]);
        this.setState({ dbData, dbHeader });
      }
    });
  };

  doUseLocalFile = () => {
    const currentState = this.state.useUploadedFile;
    this.setState({ useUploadedFile: !currentState });
  };

  // When the component is mounted, retrieve the database from sql.
  async componentDidMount() {
    await this.getDataFromDb();
  }

  render() {
    let selectInput;
    let chart;
    let table;
    let chartData;
    let chartTitle;

    // If user requests to use local file, then prioritize that
    if (this.state.useUploadedFile) {
      chartData = this.getChartData(
        this.state.csvData,
        this.state.selectedField
      );
      chartTitle = this.getChartTitle(this.state.selectedField);
    } else if (this.state.dbData) {
      // Else just use the database data.
      chartData = this.getChartData(
        this.state.dbData,
        this.state.selectedField
      );
      chartTitle = this.getChartTitle(this.state.selectedField);
      table = (
        <DataTable
          title="Data of COVID-19 Based on LGA"
          dataSent={this.state.dbData}
          header={["LGA", "population", "active", "cases", "rate", "new"]}
          apiUrl={POST_SINGLE_DATA_PATH}
          databaseChanged={() => this.getDataFromDb()}
        />
      );
    }

    if (chartData && chartTitle) {
      // After retrieving chart data, if there is no data (for example if there's 0 cases in COVID, then do not display chart and options)
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
          responsive: {
            rules: [
              {
                condition: {
                  maxWidth: 500,
                },
                chartOptions: {
                  plotOptions: {
                    pie: {
                      size: "165%",
                      dataLabels: {
                        enabled: false,
                      },
                      showInLegend: true,
                    },
                  },
                },
              },
            ],
          },
        };
        chart = (
          <HighchartsReact
            highcharts={Highcharts}
            options={options}
            containerProps={{ style: { height: "100%" } }}
          />
        );
        selectInput = (
          <SelectInputContainer
            options={this.state.fields}
            changed={this.displayChart}
          />
        );
      } else {
        // If there are no data points to place, then do not create the chart but rather display text.
        chart = (
          <div>
            The data has a total of 0 possible points to plot, which means that
            there are nothing to plot.
          </div>
        );
      }
    }

    return (
      <Main>
        <HeaderContainer>
          <FileInput
            name="fileInput"
            labelContent="Upload the LGA CSV here"
            accept=".csv"
            onChange={this.showFile}
          />
          <SubmitButton
            disabled={this.state.csvData ? false : true}
            onClick={this.sendDataToDb}
          >
            Submit File To Database
          </SubmitButton>
          <SubmitButton
            disabled={this.state.csvData ? false : true}
            onClick={this.doUseLocalFile}
          >
            {this.state.useUploadedFile
              ? "Return To Previous Data"
              : "Show Local Data To Chart"}
          </SubmitButton>
        </HeaderContainer>
        <Main.Content>
          {selectInput}
          <Main.ChartContainer>{chart}</Main.ChartContainer>
          <Main.TableContainer>{table}</Main.TableContainer>
        </Main.Content>
      </Main>
    );
  }
}
