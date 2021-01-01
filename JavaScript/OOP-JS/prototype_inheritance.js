function Animal (name) {
	this.name = name
}

Animal.prototype.sayHello = function() {
	console.log("Hello, my name is "+this.name)
}

function Dog(name, color) {
 Animal.call(this, name)
 
 this.color = color
}

Dog.prototype = Object.create(Animal.prototype)

Dog.prototype.constructor = Dog

Dog.prototype.bark = function () {
	console.log("Bark!");
}

const l = new Dog("L")

l.bark()
l.sayHello()

