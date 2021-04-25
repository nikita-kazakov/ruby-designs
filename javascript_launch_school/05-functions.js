// Written on October 15, 2020
// Notes from Launch School's Javascript Book
// https://launchschool.com/books/javascript/

// =====
// Functions
// =====

// Functions are what is known as METHODS in Ruby.
// It's a way to wrap your code into a small package.
// What if you wanted to run you piece of code thousands of times? You don't want to repeat all those lines of code.
// You can extract the code into a container and this container is called a function.

// You must define a function with a reserved keyword 'function' followed by a pair of parenthesis.
// Then you give it an opening curly brace (code block start) and a closing brace (code block end) on a different line.

function speak() {
    console.log('Hi!')
}

// Let's say we want to repeat that 5 times. Instead of:
console.log('Hi!')
console.log('Hi!')
console.log('Hi!')
console.log('Hi!')
console.log('Hi!')

// Just call the function that has that statement in it's code block:
speak()
speak()
speak()
speak()
speak()

// A powerful feature is passing parameters to a function. You can pass data into a function so that it's evaluated with the function.

function sayMyName(name) {
    console.log(`Your name is ${name}`)
}
sayMyName("Jack")       // "Your Name is Jack"

// The passed in parameters become LOCAL VARIABLES within the function code block.
// You can pass in multiple parameters:
function nameAndAge(name, age) {
    console.log(`My name is ${name} and I am ${age}`)
}

nameAndAge("Bill", 20)      //  "My name is Bill and I am 20"

function multiply(firstNumber, secondNumber) {      // Inside the parenthesis are the PARAMETERS. Parameters can be thought of as placeholders.
    return firstNumber * secondNumber               // Here...they are arguments. Arguments are actual values that are STORED in the placeholders.
}

// Don't worry about getting parameters and arguments right / wrong. Most developers use those terms interchangeably.
// We 'call' a function when we run it.
sayMyName("Jack")       // sayMyName function is called.

// Returning Values. You must use a 'return' if you want to return a value from the function.
// By default a function evaluates to an 'undefined'. That's why you need to 'return'

function multiply(a, b) {
    a * b       // Whoops! Forgot 'return'. It will return an undefined by default.
}
multiply(2,3)       // Will return an UNDEFINED.

// Let's try again with 'return'.
function multiply(a, b) {
    return a * b
}
multiply(2,3)       // 6. GOOD!

2 + multiply(2, 3)  // 8
console.log(`two times 3 is ${multiply(2,3)}`)  // two times 3 is 6


// =====
// Default Parameters
// =====

// You can add default values to parameters in case no parameters are passed in.

function playSong(song = 'random song!') {
    return `now playing ${song}`
}

// This is a very nifty feature. Javascript assigns the 'random song!' string to the song parameter.
// However, if you pass in your own song parameter, it overwrites the value with YOUR song value.
// If you don't pass anything in, it keeps the default song parameter.

playSong('breathe')     // 'now playing breathe'
playSong()                   // 'now playing random song!'



// =====
// NESTED FUNTIONS
// =====

// Functions are flexible in that they can be created and called from anywhere.
// You can call a function from other functions!

function playSong() {
    function sayArtistName() {
        console.log("Pink Floyd")
    }
    sayArtistName()
}

// sayArtistName gets created in the playSong function block. When the block ends, sayArtistName function is destroyed.

playSong()      // Pink Floyd

// Let's dress it up even more:

function playSong() {
    function sayArtistName() {
        return 'Pink Floyd'
    }

    console.log(`The artists name is ${sayArtistName()}`)
}

playSong()               // The artists name is Pink Floyd
// sayArtistName()       // ReferenceError. This function was destroyed after the playSong function block ended.



// =====
// VARIABLE SCOPE
// =====

