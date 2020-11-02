import React from "react";
import { SelectInput } from "../components";

// Container for select input
// Note: This is the container that will be called on the application and not the selectInput container.
export function SelectInputContainer({ options, changed }) {
  return (
    <SelectInput name="options" onChange={changed}>
      {options.map((el) => {
        return (
          <SelectInput.Option key={el} value={el}>
            {el}
          </SelectInput.Option>
        );
      })}
    </SelectInput>
  );
}
