import styled from "styled-components/macro";

export const Container = styled.div`
  text-align: center;
  background-color: white;
  margin: 3.5rem;
  padding: 2rem;
  border-radius: 3px;
  @media (max-width: 450px) {
    margin: 1.5rem;
    padding: 1rem;
  }

  @media (max-width: 330px) {
    margin: 0;
  }
  box-shadow: -3px -3px 5px rgba(255, 255, 255, 0.3),
    5px 5px 10px rgba(0, 0, 0, 0.4);
`;

export const Content = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
`;

export const ChartContainer = styled.div`
  margin: 1.5rem 0;
  width: 100%;
  height: 100%;

  @media (min-width: 1600px) {
    height: 600px;
  }
`;

export const TableContainer = styled.div`
  width: 100%;
`;
