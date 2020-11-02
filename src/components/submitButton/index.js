import React from "react";
import { Button } from "./styles/submitButton";

// Custom component for styling based on button.
export default function SubmitButton({ children, ...restProps }) {
  return <Button {...restProps}>{children}</Button>;
}
