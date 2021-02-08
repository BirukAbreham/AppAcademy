import { compose, pipe } from "lodash/fp";

// function as first-class citizens in JS
function sayHello() {
  return "Hello World";
}

function greet(fnMessage) {
  console.log(fnMessage());
}

greet(sayHello);

// function composition
let input = "   JavaScript    ";
let output = "<div>" + input.trim() + "</div>";

const trim = (str) => str.trim();
const wrapInDiv = (str) => `<div>${str}</div>`;

output === wrapInDiv(trim(input)); // function composition

// alternative
const transformRightToLeft = compose(wrapInDiv, trim);
const transform = pipe(trim, wrapInDiv);
output === transformRightToLeft(input);
output === transform(input);

// currying
const trim1 = (str) => str.trim();
// const wrapInDiv = (str) => `<div>${str}</div>`;
const wrap = (type, str) => `<${type}>${str}</${type}>`;
const toLowerCase = (str) => str.toLowerCase();

const transform1 = pipe(trim, toLowerCase, wrap("div"));
console.log(transform1(input));


// Pure function
// immutability
const person = { name: "John" };
const update = Object.assign({}, person, { name: "Bob", age = 30 });
console.log(update);

// better way of immutability
const updated = { ...person, name: "Bob" };
console.log(updated);