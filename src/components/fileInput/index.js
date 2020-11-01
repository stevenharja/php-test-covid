import React from "react";
import { File, Label } from "./styles/fileInput";

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
      <Label for={name}>{labelContent}</Label>
    </React.Fragment>
  );
}
