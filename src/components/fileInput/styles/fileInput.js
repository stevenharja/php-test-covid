import styled from "styled-components/macro";

export const File = styled.input`
  display: none;
`;

export const Label = styled.label`
  border: 1px solid #333333;
  text-align: center;
  padding: 0.5rem;
  border-radius: 100px;
  cursor: pointer;
  transition: all 0.2s;
  font-size: 1rem;
  margin: 0.5rem;

  @media (max-width: 250px) {
    font-size: 0.75rem;
  }

  @media (min-width: 1600px) {
    font-size: 1.25rem;
  }

  &:hover {
    box-shadow: 1px 1px 7px rgba(0, 0, 0, 0.2);
    background-color: #ed8f03;
    color: white;
  }
`;
