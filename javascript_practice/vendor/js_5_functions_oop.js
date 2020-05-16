// JavaScript Crash Course - Loops
// https://www.youtube.com/watch?v=hdI2bqOjy3c
// January 2020

//Let's talk about Functions / Object / OOP

//Let's create a simple addition function. Functions in JS are methods in Ruby.
function addNums(num1, num2){
    console.log(num1 + num2)
}

// We need to CALL the function so something happens.
addNums()       // this will result in NaN error. You didn't pass parameters.

// You can set DEFAULT values to your parameters like in Ruby.
function addNums(num1 = 1, num2 = 2){
    console.log(num1 + num2)
}

addNums()                    // 3. Uses defaults.
addNums(3,3)      // 6. Uses passed numbers.


// Use RETURN to return whatever you need from functions.
// In Ruby the last line is returned automatically. Not in JS. You have to say 'return'

function addNums(num1, num2){
    num1 + num2                 //No return specified. Bad.
}

console.log(addNums(2,3))   // Since, no return, it will return undefined.

// Now let's add a return and try again.
function addNums(num1, num2){
    return num1 + num2
}

console.log(addNums(2,3))   // 5 is returned.


// Arrow functions - introduced in ES6. They clean things up.
// we don't use the word function here but instead use arrow and assign it to variable.
// They are like blocks in Ruby (no yield)
// with arrow functions, you don't need to use the RETURN keyword. It does it automatically.
const addNums2 = (num1 = 1, num2 = 2) => {
    return num1 + num2
}

console.log(addNums2(2,3))   // 5 is returned.

// Arrow functions have a lexical THIS. It has an extra advantage in using this keyword.

// Object Oriented Programming.
// Two ways to do this:
// 1. Constructor with Prototypes.
// 2. ES6 classes.

// Here's the constructor with prototypes.
// 'this' here is like an instance variable in Ruby. Each object will have a different instance variable property when instantiated.
function Person(firstName, lastName, dob){
    this.firstName = firstName
    this.lastName = lastName
    this.dob = dob
}

// Instantiate that object with the constructor function.
let person1 = new Person()
console.log(person1)    //look at console. You'll see the object.

// Let's create new people (instantiate them)
let mary = new Person('mary', 'smith', 10)
console.log(mary)


// You can add METHODS!
function Person(firstName, lastName, dob){
    this.firstName = firstName
    this.lastName = lastName
    this.dob = dob
    this.getBirthYear = function(){
        return this.dob
    }
}

// console.log(mary.getBirthYear())        // 10

// Let's talk about prototypes. What we did above by adding a function methods to the function is not the best way to do things.
// We want to add these functions to the PROTOTYPE INSTEAD!
// Look at the console.log for that Person object. You want all methods in the prototype.
// You only want properties in the Person object.


// Let's redo that properly in Prototypes.
// Remember in ES6 you can use classes. Use classes instead going forward.
// This prototype business is OLD SCHOOL JS.

function Person(firstName, lastName, dob){
    this.firstName = firstName
    this.lastName = lastName
    this.dob = dob
}
// This is how you add a method actually to person object in OLD JS.
Person.prototype.getBirthYear = function(){
    return this.dob
}

jack = new Person('jack', 'black', 1990)
console.log(jack)       // notice in console you see the function in the prototype!

console.log(jack.getBirthYear())    // 1990


// ES6 Classes - Forget the prototype stuff from ES5. Use Modern Classes instead to instantiate objects.
// Classes is synctactic sugar. It does the same exact thing we did with prototype methods.
// However, OOP languages use classes. So does Ruby.

class Human{
    constructor(firstName = 'defaultFirst', lastName = 'defaultLast', dob = 1900){
        this.firstName = firstName
        this.lastName = lastName
        this.dob = dob
    }

    //add methods here.
    getBirthYear() {
        return this.dob
    }

    getFullName() {
        return `${this.firstName} ${this.lastName}`
    }
}

nikita = new Human('Nikita', 'Kaz', 1901)
console.log(nikita)     //look at console. methods got placed in prototype correctly.
console.log(nikita.getBirthYear())      // 1901
console.log(nikita.getFullName())       // Nikita Kaz


// Random stuff
// In your browser window, the WINDOW object is the parent object. The big daddy.
console.log(window)
// Notice that window object has JQUERY in it! also has nikita object and all objects we created here!
// To run JQUERY, you need to run it inside the WINDOW OBJECT. That's why.
// Since window is the top level, we don't need to do anything to run things in window.
console.log(window.document)

// Use console.log to see exactly what happens when using Jquery. It will show you what's possible!
// Console.log is POWERFUL AS HELL.
console.log($('.container'))

//Finish the crash course video if you want to learn how to manipulate the DOM with ES6.