import React from "react";
import styled from "styled-components";

const StyledSection = styled.div`
  background-color: #ffffff;
  border: solid 3px grey;
  margin: 4px;
  width: 300px;
  height: 50px;
  border-radius: 10px;
  display: flex;
  justify-content: left;
  font-size: 40px;
  color: #ff6961;
`;

const WeekdayTitle = styled.div`
  display: flex;
  justify-content: center;
  width: 50px;
  border-right: solid 3px lightgrey;
`;

const WeekendTitle = styled(WeekdayTitle)`
  background-color: lightgray;
  border-radius: 7px 0 0 7px;
`;

const ProgressBar = styled.div`
  height: 50px;
  width: ${({ progress }) => progress || "0%"};
  background-color: ${({ progress }) => {
    let value = Number(progress.slice(0, -1));
    if (value > 80) return "green";
    else if (value < 80 && value > 60) return "orange";
    else if (value < 60 && value > 35) return "yellow";
    else return "red";
  }};
`;

const Section = ({ text, progress }) => {
  const isWeekend = text === "S";

  return (
    <div>
      <StyledSection>
        {!isWeekend && <WeekdayTitle>{text}</WeekdayTitle>}
        {isWeekend && <WeekendTitle>{text}</WeekendTitle>}
        <ProgressBar progress={progress} />
      </StyledSection>
    </div>
  );
};

export default Section;
