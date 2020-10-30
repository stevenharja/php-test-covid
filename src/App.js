import React, { Component } from "react";
import Papa from "papaparse";
import { HeaderContainer } from "./containers/header";
import { SelectInputContainer } from "./containers/selectInput";
import Main from "./components/main";
import { PieChart } from "recharts";

//Packages to use
/*
https://www.npmjs.com/package/papaparse
https://styled-components.com/
*/

export default class App extends Component {
  state = { chartData: null, chartFields: null };
  showFile = (e) => {
    e.preventDefault();
    Papa.parse(e.target.files[0], {
      complete: (results, file) => {
        this.setState({
          chartData: results.data,
          chartFields: results.meta.fields,
        });
      },
      header: true,
      dynamicTyping: true,
    });
  };

  displayChart = (e) => {
    e.preventDefault();
    console.log(e.target.value);
  };

  render() {
    let selectInput;
    if (this.state.chartData) {
      console.log(this.state.chartData);
      selectInput = (
        <SelectInputContainer
          options={this.state.chartFields}
          changed={this.displayChart}
        />
      );
    }

    return (
      <React.Fragment>
        <Main>
          <HeaderContainer>
            <input
              type="file"
              accept=".csv"
              onChange={(e) => this.showFile(e)}
            />
          </HeaderContainer>
          {selectInput}
        </Main>
      </React.Fragment>
    );
  }
}
