import React from "react";
import styled from "styled-components";
import Button from "./Button";

const Title = styled.h1`
  color: #aac9f0;
`;

// extending components
const SubTitle = styled(Title)`
  font-size: 14px;
`;

const Section = styled.div`
  background-color: #f0d1aa;
  display: flex;
  flex-direction: column;
  justify-content: center;
  color: #f0aeaa;
  border-radius: 15px;
`;

const Content = () => {
  return (
    <Section>
      <Title>Section</Title>
      <SubTitle>I am a subtitle</SubTitle>
      <Button primary text="me first" />
      <Button text="me secondary" />
    </Section>
  );
};

export default Content;
