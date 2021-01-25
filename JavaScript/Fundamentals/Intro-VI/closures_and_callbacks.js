"use strict";

function soundMaker(sound, times) {
  function makeSound() {
    // sound variable is used from the parent function
    // this makes the makeSound function closure
    console.log(`${sound}`);
  }

  for (let i = 0; i < times; i++) {
    makeSound();
  }
}

// soundMaker("woof", 5);

function summation(arr) {
  let sum = 1;

  // this is a closure
  function summer() {
    for (let i = 0; i < arr.length; i++) {
      sum *= arr[i];
    }
  }

  summer();

  return sum;
}

// console.log(summation([1, 2, 3, 4]));

// callbacks
let callback = function () {
  console.log("It has been 5 seconds!");
};
let timeToWait = 5000; //ms

// global.setTimeout(callback, timeToWait);

// more likely to see:
global.setTimeout(function () {
  console.log("It has been 5 seconds!");
}, 5000);

// the above is ES5

// ES6;
global.setTimeout(() => console.log("It has been 5 seconds!"), timeToWait);
