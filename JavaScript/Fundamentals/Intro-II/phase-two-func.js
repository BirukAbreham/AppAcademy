function titleize(list, printCallback) {
  let capList = list.map((word) => `Mx. ${word} Jingleheimer Schmidt`)
  for(let cap of capList) {
    printCallback(cap)
  }
}

titleize(["Mary", "Brian", "Leo"], function(word) { console.log(word) } )

function Elephant(name, height, list) {
  this.name = name
  this.height = height
  this.list = list
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes "phrRRRRRRR!!!"`)
}

Elephant.prototype.grow = function () {
  this.height += 12
}

Elephant.prototype.addTrick = function (trick) {
  this.list.push(trick)
}

Elephant.prototype.play = function () {
  let idx = Math.floor(Math.random() * Math.floor(this.list.length))
  console.log(`${this.name} is ${this.list[idx]}`)
}

let elephant = new Elephant('Babu', 10, ['play trick one'])
elephant.trumpet()
elephant.grow()
console.log(elephant.height)
elephant.addTrick('play trick two')
console.log(elephant.list)
elephant.play()

