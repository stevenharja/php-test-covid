import React from "react";
import { Container, Title, Inner } from "./styles/header";

// Custom component for header to help with styling.
export default function Header({ children, ...restProps }) {
  return <Container>{children}</Container>;
}

Header.Title = function HeaderTitle({ children, ...restProps }) {
  return <Title {...restProps}>{children}</Title>;
};

Header.Inner = function HeaderInner({ children, ...restProps }) {
  return <Inner {...restProps}>{children}</Inner>;
};
