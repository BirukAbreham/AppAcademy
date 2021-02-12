import React from "react";
import ReactDOM from "react-dom";

import configureStore from "./frontend/store/store";

document.addEventListener("DOMContentLoaded", function () {
  window.store = configureStore;
  ReactDOM.render(<h1>Todo structure</h1>, document.getElementById("root"));
});
