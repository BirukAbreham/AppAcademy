import { createStore } from "redux";
import reducer from "./reducer";

const store = createStore(reducer);

export default store;

// window.store = store;
