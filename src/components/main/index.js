import React from "react";
import { Container } from "./styles/main";

export default function Main({ children, ...restProps }) {
  return <Container>{children}</Container>;
}
