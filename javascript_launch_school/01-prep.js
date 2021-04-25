// Written on October 15, 2020
// Notes from Launch School's Javascript Book
// https://launchschool.com/books/javascript/

// =====
// STYLE
// =====

// Javascript uses camelCase as a standard.
// Can't start function names or variable names with a digit.
let bigCat = 1 // GOOD
let big_cat = 1 // BAD

// Comments are written with //

// Use ALLCAPS to represent constants. If two words, add an underscore.
// Don't start / end constants with an underscore.
const PI = 3.1415
const FIXED_RATE = 0.125

// A code block should have the opening brace on the SAME LINE as the function or conditional expression (eg. if statement)
// Use a single space between function name and curly bracket

function hello(){ // BAD. No space.
}

function hello () // BAD. Opening Curl on a different line than function.
{
}

function hello() { // GOOD.

}

// Use spaces between operators and operands
let apples=4+3 // BAD
let apples = 4 + 3 // GOOD

// Use semicolons to terminate each logical line unless the line ends with {, }, or :
// Not going to get into the semicolon argument here.





// =====
// Methods and Properties
// =====

// This is a method called on a String.
'bill'.toUpperCase()

// Some data types have properties associated with them.
// A property says something about the value while a method DOES something with that value.
// Since a property is not a method, it doesn't have curly brackets after it.
'bill'.length // It says the length is 4. It does NOTHING with the string.

// FYI -- In RubyMine and IntelliJ, you'll see little circles with a P or an M around methods and properties in the autocomplete.