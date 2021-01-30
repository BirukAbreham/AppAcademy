import React from "react";

const Greeting = ({ isLoggedIn }) => {
  if (isLoggedIn) {
    return <h3>Hello subscriber</h3>;
  }

  return <h3>Hello guest user</h3>;
};

export default Greeting;
