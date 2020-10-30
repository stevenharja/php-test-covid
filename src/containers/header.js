import React from "react";
import { Header } from "../components";

export function HeaderContainer({ children }) {
  return (
    <Header>
      <Header.Title>Victoria's COVID-19 Data</Header.Title>
      <Header.Inner>{children}</Header.Inner>
    </Header>
  );
}
