const readline = require('readline')

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function addNumbers(callback) {
  reader.question("Enter #1: ", function(num1) {
    reader.question("Enter #2: ", function(num2) {
      const num_1 = parseInt(num1)
      const num_2 = parseInt(num2)

      callback(num_1 +  num_2)
    })
  })
}

addNumbers(function(result) {
  console.log(`The result is: ${result}`)
  reader.close()
})

