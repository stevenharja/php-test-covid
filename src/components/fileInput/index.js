import React from "react";
import { File, Label } from "./styles/fileInput";

// Custom file input component, with label to replace the default file input.
export default function FileInput({
  children,
  name,
  labelContent,
  ...restProps
}) {
  return (
    <React.Fragment>
      <File type="file" id={name} {...restProps}>
        {children}
      </File>
      <Label htmlFor={name}>{labelContent}</Label>
    </React.Fragment>
  );
}
