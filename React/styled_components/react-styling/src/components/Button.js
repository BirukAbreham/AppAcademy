import React from "react";
import styled from "styled-components";

const StyledButton = styled.button`
  background-color: ${({ primary }) => (primary ? "red" : "blue")};
  display: flex;
  justify-content: center;
  padding: 5px;
  margin: 5px;
  border-radius: 15px;
`;

const Button = ({ text, primary }) => {
  return <StyledButton primary={primary}>{text}</StyledButton>;
};

export default Button;
