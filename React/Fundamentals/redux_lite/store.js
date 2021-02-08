// Global application state
class Store {
  constructor(rootReducer) {
    this.state = {};
    this.rootReducer = rootReducer;
  }

  getState() {
    const copyState = Object.assign(this.state);
    return copyState;
  }
}
