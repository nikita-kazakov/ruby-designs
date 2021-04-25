// Written on October 15, 2020
// Notes from Launch School's Javascript Book
// https://launchschool.com/books/javascript/

// =====
// Variables
// =====

// I won't go through EXACTLY what a variable is. I assume some knowledge about variables.
// A variable is a memory space a program can store data. Like a pointer.

// johnAge POINTS to 30. johnAge is easier to read and remember. That's why we use variables.
// equal sign assigns 30 to johnAge. Don't confuse equal with a ===.

let johnAge = 30
johnAge     // 30

let firstNumber = 5
let secondNumber = 3
firstNumber + secondNumber      // 8




// =====
// let and const
// =====

// Use let instead of var as var creates a global variable.
let lowNumber = 7   // returns undefined because we're declaring a variable and initializing it with a value.
highNumber = 7      // returns 7. It's because we're ASSIGNING a variable.

// const keyword is used for initializing constants.
// once assigned, they can't be modified. Use these to assign constants that WONT change.
const SECONDS_PER_HOUR = 3600
const MINUTES_PER_HOUR = 60
const INTEREST_RATE = 0.25




// =====
// VARIABLE SCOPE
// =====

// The location where you declare a variable will determine it's scope (where it's available).
// let and const keywords have block scope. Block is between an opening and closing curly brace.
// FYI var does not use block scoping. We can avoid it for now.

if (5 === 5) {       // start of bock
                    // block body
}                   // end of block



if (5 === 5) {
    let b = 50
}
console.log('b')    // ReferenceError. Why? Because b was declared in a BLOCK. you're calling it outside the block.

// Another example:
let c = 'bob';
if (5 === 5) {
    c = 'al';
}
console.log(a);    // al. Why? Because we declared a OUTSIDE the block. It is available in the block and after the block is ends.

// Another example:

{
    let dogName = "Silly"
}
// console.log(dogName)        // Reference error. You declared that variable IN the block scope and you're calling it OUTSIDE.

// Yet another example of scope:
let toy = 'doll';
{
    let toy = 'truck';
}

console.log(toy);       // doll. Why? Because you are outside of block. Whatever was declared inside the code block was also CLOSED after the code block closed.


// ALWAYS declare variables with either a let / const.
let a = 5       // GOOD
a = 5           // BAD. This is a GLOBAL variable now. It doesn't care out block or function scope. Hard to debug and easy to mess up. Don't do it.










// EXERCISES
let guyName = "Victor"
console.log(`Good Morning, ${guyName}.`)

let guyAge = 10
console.log(`In 10 years, you will be ${guyAge + 10}`)
console.log(`In 20 years, you will be ${guyAge + 20}`)