import styled from "styled-components";

export const File = styled.input`
  display: none;
`;

export const Label = styled.label`
  border: 1px solid #333333;
  padding: 0.5rem;
  border-radius: 100px;
  cursor: pointer;
  transition: all 0.2s;

  &:hover {
    box-shadow: 1px 1px 7px rgba(0, 0, 0, 0.2);
    background-color: #ed8f03;
    color: white;
  }
`;
