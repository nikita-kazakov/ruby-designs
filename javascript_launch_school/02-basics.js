// Written on October 15, 2020
// Notes from Launch School's Javascript Book
// https://launchschool.com/books/javascript/

// =====
// Data Types
// =====

// Javascript has FIVE primitive data types:
// String, Number, Boolean, Undefined, Null   (ES6 introduces two more: Symbol and BigInt)


// =====
// STRINGS
// =====

// You can write strings with a single or double quote:
'good string'
"good string"

// Double strings are great because you can use SINGLE strings inside of them:
"He said 'whatever!' to me."

// Javascript has string interpolation. Powerful. Use backticks.
// Javascript will go into the ${} section and the output will be a string.
catName = "Toly"
catAge = 10
`John has a cat named ${catName} and he is ${catAge}.` // John has a cat named Toly and he is 10.

// String Concatenation Without string interpolation, it would look like this:
"John has a cat named " + catName + "and he is " + catAge + "."
'desk' + 'top'  // desktop
'2' + '3'       // '23'. Why? Because '2' and '3' are STRINGS. Do typeof to check. You're concatenating strings!
2 + 3           // 5. Because both are numbers.

// Coersion
'1' + 4                   // '14'. It tries to coerce the number 4 into a string. Success. Now it can concatenate two strings. This is IMPLICIT coercion.
'4' - 3                   // 1. It coerces '4' into a number. 4 - 3 = 1. Implicit coercion.
Number('4') - 3     // 1. Convert string into a number first! Much better. This is EXPLICIT coersion.
parseInt('4') - 3      // 1. Specifically converts string into an integer.
parseInt('3.1415')     // 3. parseInt STOPS converting once it reaches an invalid character. period is an invalid character here.
parseInt('34asdf')     // 34. letters are invalid.
String(20)          // '20'. coerces number into a string.

// Moral of the story: Don't count on coersion. Instead, ensure you have a NUMBER type before performing a mathematical operation.

// =====
// NUMBERS
// =====

// Example of numbers in JS
// Don't use commas nor periods when writing out numbers.
// 1, 5, 5.5, -2, 7.66, 299381

// =====
// Booleans
// =====

// TRUE or FALSE.
let admin = true
let active = false

// Booleans are used in comparison operators === or > or <. These either return true or false.


// =====
// Undefined
// =====

// Undefined is the absence of a return.
console.log('technically undefined') // returns undefined because it writes to the console but doesn't return anything.
var person // undefined because nothing is assigned.
let person // also undefined.
const BLAH // undefined
let person = 3 // ALSO undefined. Whey? Because you're simply assigning a value but you're not returning a value here.

// Look at this function:
function speak() {
    // Will return undefined because you're simply writing a function and not calling it.
}

speak() // Undefined. The function didn't have anything to return even though you called it.

function speak() {
    return 5 // Will STILL return undefined because you're simply writing a function. However, we have a return line now.
}

speak() // 5. The function returns 5.


// =====
// NULL
// =====

// Null represents emptiness or nothing. Like nil in Ruby.
let age = null

// Use typeof Operator to see what the type is.
typeof 23         // number
typeof 'bob'      // string
typeof true       // boolean
typeof undefined  // undefined
typeof null       // object (Weird JS. It's this way because this was a type in the first version of JS. JS is backwards compatible and thereby this error still exists)
typeof [5, 6]     // object




// =====
// Operations
// =====

// Addition, Subtraction, Multiplication
3 + 5       // 8
6 - 2       // 4
7 * 2       // 14
20 / 5      // 4
20 / 6      // 3.33333 (float)
20 / 3.5    // 5.714 (float)

// Remainder. This is not a mathematical modulo.
20 % 5 // 0
20 % 3 // 2. Because you can't get to 20 with a 3. The maximum you can get to is 6x3 = 18. Then you have a remainder of 2 to get to 20.
// Fun fact. The only place I ever had to use modulus was the fizzbuzz challenge (using Ruby).

// NaN - Not a number
0 / 0           // NaN
5 / undefined   // NaN
'hello' / 2     // NaN. Can't coerce into a string.
5 / null        // Infinity. WTF javascript.
NaN == NaN      // false. WTF javascript.

// Javascript also has Infinity but it is WACKY as hell. Not worth remembering because you'll have a lot of WTF Javascript moments.


// =====
// Equality
// =====

// If you want to know two values are identical, use ===. In most languages, you'd use ==. In Javascript however, since the language
// carries baggage from the past == doesn't mean what you think it means. Use ===.

5 === 5         // true
10 === 4        // false
'bob' === 'bob' // true
'Bob' === 'bob' // false (case sensitive!)




// =====
// Data Structures
// =====

// Arrays - Arrays can contain numbers, strings, or booleans.
let numbers = [1, 2, 3, 4, 5]

// Array elements start with zero. Get first element:
numbers[0]  // 1
numbers[numbers.length - 1] // 5. Get last element of array.

// =====
// Objects
// =====

// Objects in Javascript are like Ruby Hashes. It's a key-value pair.
{ fruit: 'apple' }
{ fruit: 'apple', animal: 'cat' }       // have multiple key-value pairs if needed.

// Searching by key and getting the value.
let objectOne = { fruit: 'apple', animal: 'cat' }
objectOne['fruit']      // apple


// =====
// Expressions
// =====

// Use parenthesis liberally to make your mathematical expressions readable.
2 + (5 + 2)         // 9


// Javascript has statements. This is where you declare something.
let treeColor = 'green'

// Javascript expressions can span over multiple lines. Looks ugly though. Just because you could doesn't mean you should.
number = 3 + 4 +
         5 + 6

