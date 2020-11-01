import styled from "styled-components";

export const Select = styled.select`
  text-transform: uppercase;
  font-family: inherit;
  border-radius: 100px;
  cursor: pointer;
  padding: 1rem;
  margin: 1rem;
  font-weight: 700;
  transition: all 0.2s;

  &:hover {
    box-shadow: 1px 1px 7px rgba(0, 0, 0, 0.2);
    background-color: #ed8f03;
    color: white;
  }
`;

export const Option = styled.option``;
