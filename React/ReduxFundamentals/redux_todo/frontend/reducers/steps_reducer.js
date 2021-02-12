import {
  RECEIVE_STEP,
  RECEIVE_STEPS,
  REMOVE_STEP,
} from "../actions/step_actions";

const stepsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_STEPS:
      const newSteps = {};
      action.steps.forEach((step) => {
        newSteps[step.id] = step;
      });
      return newSteps;
    case RECEIVE_STEP:
      const receivedStep = Object.assign({}, state);
      receivedStep[action.step.id] = action.step;
      return receivedStep;
    case REMOVE_STEP:
      const removedStep = Object.assign({}, state);
      delete removedStep[action.step.id];
      return removedStep;
    default:
      return state;
  }
};

export default stepsReducer;
