import React from "react";
import { SelectInput } from "../components";
import PropTypes from "prop-types";

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

SelectInputContainer.propTypes = {
  options: PropTypes.array,
  changed: PropTypes.func,
};
