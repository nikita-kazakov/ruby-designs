// JavaScript Crash Course - Strings
// https://www.youtube.com/watch?v=hdI2bqOjy3c
// January 2020

let name = "Nick"
let age = 33

// Concatenation
// You can concat without string interpolation:
console.log("My name is " + name + " and I am " + age)

// In ES6, we can a Template String (string interpolation in Ruby). Use this instead.
console.log(`My Name is ${name} and I am ${age}`)

// Let's get the length.
// Notice that your IDE will have an auto-complete which will show available properties.

// Notice there are no parenthesis on length. It's a property not a method. A method has parenthesis.
// Notice that in RubyMine, you'll see a circle with a p in autosuggest that shows the property. and
// circle with an m if it is a method.

console.log(name.length)  // 4

// Property vs Method
// Object in Javascript is a key-value stored in a hash. Property has a key and an assigned value.
// A method has a key (method name) but the value is a FUNCTION.
// auto-complete is your friend! explore Objects and their methods!

console.log(name.bold()) //<b>Nick</b>
console.log(name.toUpperCase()) //NICK

console.log(name.substring(0, 2)) // Ni

// You can also add methods at the end of others:
console.log(name.substring(0, 2).toUpperCase())  // NI

// Split a string into an array
console.log(name.split(''))     // Output is an array! ['n', 'i', 'c', 'k']

let fruits = 'apple, grape, orange'
console.log(fruits.split(','))  // ['apple', 'grape', 'orange']


// Arrays
// Here's a way to create an array from an object (not too often used) (this is a constructor)
// You're instantiating a new array from an ARRAY OBJECT.
let numbers_with_constructor = new Array()

// Here's the same thing with syntactic sugar.
let numbers_array = ['apple', 'orange', 'pear']
console.log(numbers_array)

// In JS, you can have MULTIPLE DATA TYPES in the same array. For example:
let array_types = ['apple', 'orange', 5, undefined, true]
console.log(array_types)