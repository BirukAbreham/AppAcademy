import React from "react";
import HelloWorld from "./hello_world";
import Clock from "./clock";
import Toggle from "./toggle";
import Greeting from "./conditional_rendering";
import Mailbox from "./inline_logical";
import NumberList from "./list";
import NameForm from "./forms";

const All = () => {
  return (
    <div>
      <h1>Starting on Hello World</h1>
      <HelloWorld />

      <h1>State in a component</h1>
      <Clock />

      <h1>Toggle event handling in react</h1>
      <Toggle />

      <h1>Conditional rendering</h1>
      <Greeting isLoggedIn={true} />

      <h1>Inline conditional rendering</h1>
      <Mailbox unreadMessages={["React", "Re: React", "Re:Re: Reacdt"]} />

      <h1>Listing Items</h1>
      <NumberList numbers={[1, 2, 3, 4, 5]} />

      <h1>Forms</h1>
      <NameForm />
    </div>
  );
};

export default All;
