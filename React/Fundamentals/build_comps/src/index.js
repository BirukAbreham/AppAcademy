import React from "react";
import ReactDOM from "react-dom";
import Tabs from "./components/Tabs";

ReactDOM.render(
  <div>
    <h1>Tabs Demo</h1>
    <Tabs>
      <div label="Gator">
        see ya later, <em>Alligator</em>
      </div>
      <div label="Croc">
        After 'while, <em>Crocodile</em>!
      </div>
      <div label="Sarcosuchus">
        Nothing to see here, this tab is <em>extinct</em>!
      </div>
    </Tabs>
  </div>,
  document.getElementById("root")
);
