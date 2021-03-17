import React from "react";
import styled from "styled-components";

const StyledButton = styled.button`
  background-color: ${({ primary }) => (primary ? "red" : "blue")};
  display: flex;
  justify-content: center;
  padding: 5px;
  margin: 5px;
  border-radius: 15px;
  border: ${({ border }) => border || 0};

  // nested and effect styling for a component

  &:hover {
    background-color: grey;
  }

  // nested
  .subtext {
    font-size: 10px;
  }
`;

const ReversedButton = (props) => (
  <StyledButton {...props} children={props.children.split("").reverse()} />
);

const Button = ({ text, primary, border }) => {
  return (
    <StyledButton primary={primary} as={ReversedButton} border={border}>
      {text}
    </StyledButton>
  );
};

export default Button;
