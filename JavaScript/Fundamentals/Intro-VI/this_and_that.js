function times(num, fun) {
  for (let i = 0; i < num; i++) {
    fun(); // call is made "function style"
  }
}

const cat = {
  age: 5,
  ageOneYear: function () {
    this.age += 1;
  },
};

cat.ageOneYear(); // works

times(10, cat.ageOneYear); // ReferenceError: this.age is not defined
// Reason for that is times calls the fun (callback) this key becomes
// global for node or window for browser

// Solution
// bind the `this` keyword with cat object
times(10, cat.ageOneYear.bind(cat));
