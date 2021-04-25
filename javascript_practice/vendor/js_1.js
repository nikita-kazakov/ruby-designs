// JavaScript Crash Course
// https://www.youtube.com/watch?v=hdI2bqOjy3c
// January 2020

// Javascript runs on client/browser side and on the server (Node.js)
// It's a higher level, interpreted (no compiler) language. Like Ruby but different syntax.

// Use your developer tools (F12 in browser) as you go through this course.

const a = 1
const b = 2
const c = a + b

console.log('This should show up in the console.')
'a'.

// The best documentation for Javascript is MDN:
// https://developer.mozilla.org/en-US/docs/Web/API/console

// If you want to see what's in the console object, simply put the console object and see what the browser shows in the console.
console.log(console)

// You can show error messages and warning messages in the console like this. Cool stuff when error handling.
console.error("You didn't specify a parameter") // Shows it in yellow background.
console.warn("You called the JS file twice. Don't do that.") // Red background.

// VARIABLES - var, let, const

// var - don't use it. It is a GLOBAL variable. In old JS, this was all that was available.
var global_variable_unfortunately = "This is a global variable from var. Don't use it anymore."
console.log(global_variable_unfortunately)

// let - This was added with ES6. They follow block scope (not global). With let, you can reassign values.
// notice how I reassign age to 31 and it works. It's MUTABLE.
let age = 30

age = 31
console.log(age)

// const stands for constant. I couldn't do const = 30 and then change it to 31. Won't work. It's a CONSTANT.
// When do you use let vs const? There are differing opinions. This guy says use const unless you know you
// are going to reassign it. In Ruby, technically ALL variables can be reassigned unless you specifically call
// a constant. I'll stick with let.



// Data Types
// ////////////////////////

// String, Numbers, Boolean, null, undefined, Symbol(added in ES6). These are primitive data types.

// You can use single or double quotes. Semicolons OPTIONAL in Javascript.
// I come from Ruby, I'll avoid semicolons.

const name = 'John'     // String
// const age = 30          // Number
const isCool = true     // Boolean
const rating = 4.5      // Number
const x = null;         // Null

const y = undefined     // <== you are specifically defining undefined here.
let z                   // without passing anything to z, it is by default undefined.


// Testing Types
console.log(typeof age)         // number
console.log(typeof isCool)      // boolean
console.log(typeof rating)      // number
console.log(typeof x)           // object
console.log(typeof y)           // undefined
console.log(typeof z)           // undefined

// This is one of those weird things, it shows null as object. It's not really an object.
// This is an old relic of the old javascript that was left in for backwards-compatibility. It shouldn't be that way but it is. Keep this in mind.



// Concatenation
// You can concat without string interpolation:
console.log("My name is " + name + " and I am " + age)

// In ES6, we can a Template String (string interpolation in Ruby). Use this instead.
console.log(`My Name is ${name} and I am ${age}`)

