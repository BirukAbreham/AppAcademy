function add(a) {
  return function (b) {
    return a + b;
  };
}

const add1 = add(1);
add1(5); // 1 + 5
// currying
add(1)(5); // add(1, 5)

const add2 = (a) => (b) => a + b;
