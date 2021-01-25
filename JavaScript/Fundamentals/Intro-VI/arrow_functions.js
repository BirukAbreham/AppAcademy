// Anatomy of an Arrow Function
(parameters, go, here) => {
  statements;
  return value;
};
// For single-expression blocks, {} and return are implied,
// and you may omit the () when there is a single argument

// Potential Pitfalls

// Syntactic Ambiguity
const ambiguousFunc = () => {};

console.log(typeof ambiguousFunc() === "undefined"); // true

// To make a single-expression fat arrow return an empty
// object, wrap it in parentheses:
const clearFunc = () => ({});
console.log(typeof clearFunc() === "object"); // true

// No Binding
// No Constructor
// No arguments
// No Names
