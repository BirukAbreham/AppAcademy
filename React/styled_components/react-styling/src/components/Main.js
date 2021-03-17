import React from "react";
import styled from "styled-components";
import Section from "./Section";

const Title = styled.h1`
  color: #aac9f0;
`;

class Main extends React.Component {
  render() {
    return (
      <>
        <Title>Progress Tracker</Title>
        <div>
          <Section text="M" progress="80%" />
          <Section text="T" progress="65%" />
          <Section text="W" progress="95%" />
          <Section text="T" progress="30%" />
          <Section text="F" progress="40%" />
          <Section text="S" progress="75%" />
          <Section text="S" progress="100%" />
        </div>
      </>
    );
  }
}

export default Main;
