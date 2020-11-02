import React from "react";
import { Header } from "../components";

// Container used to held all the data based on the header component that was called
// Note: The header container will be the one called on the application and not header.
export function HeaderContainer({ children }) {
  return (
    <Header>
      <Header.Title>Victoria's COVID-19 Data</Header.Title>
      <Header.Inner>{children}</Header.Inner>
    </Header>
  );
}
