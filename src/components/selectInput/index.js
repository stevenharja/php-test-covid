import React from "react";
import { Select, Option } from "./styles/selectInput";

export default function SelectInput({ children, ...restProps }) {
  return <Select {...restProps}>{children}</Select>;
}

SelectInput.Option = function ({ children, ...restProps }) {
  return <Option {...restProps}>{children}</Option>;
};
