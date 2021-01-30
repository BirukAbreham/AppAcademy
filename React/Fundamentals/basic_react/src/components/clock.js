import React from "react";

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { date: new Date() };
  }

  // starts the timer after the component mounts
  componentDidMount() {
    this.timerID = setInterval(() => this.tick(), 1000);
  }

  // stops the timer when the component unmounts
  // clears the timer
  componentWillUnmount() {
    clearInterval(this.timerID);
  }

  // sets the state date to the current datetime
  tick() {
    this.setState({
      date: new Date(),
    });
  }

  render() {
    const now = this.state.date;
    return (
      <div>
        <h3>It is {now.toLocaleTimeString()}.</h3>
      </div>
    );
  }
}

export default Clock;
