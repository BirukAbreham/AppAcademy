import {
  RECEIVE_TODO,
  RECEIVE_TODOS,
  REMOVE_TODO,
} from "../actions/todo_actions";

const _initialStore = {};

const todosReducer = (state = _initialStore, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_TODOS:
      const newTodos = {};
      action.todos.forEach((todo) => {
        newTodos[todo.id] = todo;
      });
      return newTodos;
    case RECEIVE_TODO:
      const receivedTodo = Object.assign({}, state);
      receivedTodo[action.todo.id] = action.todo;
      return receivedTodo;
    case REMOVE_TODO:
      const newTodo = Object.assign({}, state);
      delete newTodo[action.todo.id];
      return newTodo;
    default:
      return state;
  }
};

export default todosReducer;
