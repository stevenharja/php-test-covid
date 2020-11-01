import React from "react";
import { Container, Content } from "./styles/main";

export default function Main({ children, ...restProps }) {
  return <Container {...restProps}>{children}</Container>;
}

Main.Content = function MainContent({ children, ...restProps }) {
  return <Content {...restProps}>{children}</Content>;
};
