import styled from "styled-components/macro";

export const Select = styled.select`
  text-transform: uppercase;
  font-family: inherit;
  border-radius: 100px;
  cursor: pointer;
  padding: 1rem;
  margin: 0.5rem;
  font-weight: 700;
  transition: all 0.2s;

  @media (max-width: 250px) {
    font-size: 0.75rem;
    padding: 0.5rem;
  }

  @media (min-width: 1600px) {
    font-size: 1.1rem;
  }

  &:hover {
    box-shadow: 1px 1px 7px rgba(0, 0, 0, 0.2);
    background-color: #ed8f03;
    color: white;
  }
`;

export const Option = styled.option``;
