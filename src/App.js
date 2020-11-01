import React, { Component } from "react";
import Papa from "papaparse";
import { HeaderContainer } from "./containers/header";
import { SelectInputContainer } from "./containers/selectInput";
import Main from "./components/main";
import * as Highcharts from "highcharts";
import HighchartsReact from "highcharts-react-official";
import FileInput from "./components/fileInput";

//Packages to use
/*
https://www.npmjs.com/package/papaparse
https://styled-components.com/
*/

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
  };
  
  showFile = (e) => {
    e.preventDefault();
    Papa.parse(e.target.files[0], {
      complete: (results, file) => {
        console.log(results);
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

  renderLabel = (entry) => {
    if (entry[this.state.selectedField] === 0) {
      return null;
    }
    return entry.LGADisplay;
  };

  getChartData = (csvData, selectedField) => {
    let chartData = [];
    csvData.forEach((element, index) => {
      if (element[selectedField] > 0) {
        chartData.push({ name: element.LGADisplay, y: element[selectedField] });
      }
    });

    return chartData;
  };

  getChartTitle = (selectedField) => {
    let title;
    this.state.fieldData.forEach((element, index) => {
      if (selectedField === element.field) {
        title = element.title;
      }
    });
    return title;
  };

  render() {
    let selectInput;
    let chart;
    if (this.state.csvData) {
      selectInput = (
        <SelectInputContainer
          options={this.state.fields}
          changed={this.displayChart}
        />
      );
    }

    if (this.state.selectedField && this.state.csvData) {
      const chartData = this.getChartData(
        this.state.csvData,
        this.state.selectedField
      );
      const chartTitle = this.getChartTitle(this.state.selectedField);

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
            <FileInput
              name="fileInput"
              labelContent="Upload the LGA CSV here"
              accept=".csv"
              onChange={(e) => this.showFile(e)}
            />
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
