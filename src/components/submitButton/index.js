import React from "react";
import { Button } from "./styles/submitButton";

export default function SubmitButton({ children, ...restProps }) {
  return <Button {...restProps}>{children}</Button>;
}
