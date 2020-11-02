import styled from "styled-components/macro";

export const Container = styled.div`
  margin: 1rem;
  @media (max-width: 300px) {
    margin: 0.25rem;
  }
`;

export const Title = styled.h1`
  font-size: 2rem;
  border-bottom: 3px solid #333333;
  text-align: center;
  @media (max-width: 300px) {
    font-size: 1.5rem;
  }
  padding-bottom: 1rem;

  @media (min-width: 1600px) {
    font-size: 3rem;
  }
`;

export const Inner = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 1rem 0;
  border-bottom: 3px solid #333333;
  @media (max-width: 450px) {
    flex-direction: column;
  }
`;
