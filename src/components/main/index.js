import React from "react";
import {
  Container,
  Content,
  ChartContainer,
  TableContainer,
} from "./styles/main";

// Main container of the app, maintaining the content, as well as the chart and table container.

export default function Main({ children, ...restProps }) {
  return <Container {...restProps}>{children}</Container>;
}

Main.Content = function MainContent({ children, ...restProps }) {
  return <Content {...restProps}>{children}</Content>;
};

Main.ChartContainer = function MainChartContainer({ children, ...restProps }) {
  return <ChartContainer {...restProps}>{children}</ChartContainer>;
};

Main.TableContainer = function MainTableContainer({ children, ...restProps }) {
  return <TableContainer {...restProps}>{children}</TableContainer>;
};
