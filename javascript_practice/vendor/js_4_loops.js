// JavaScript Crash Course - Loops
// https://www.youtube.com/watch?v=hdI2bqOjy3c
// January 2020

//Let's talk about LOOPS!

const todos = [
    {
        id:1,
        text: "take out trash",
        isCompleted: true
    },
    {
        id:2,
        text: "Meeting with boss",
        isCompleted: true
    },
    {
        id:3,
        text: "Dentist appt.",
        isCompleted: false
    }
]

// Let's talk about loops.
// You have your variable, run until, and incrementor. It will run until the for function turns true.
// With lodash...you don't have to use these ugly iterators.
for(let i = 0; i < 10; i++){
    console.log(i)
}

// while loop
let i = 0;
while(i < 10){
    console.log(i)
    i++
}

// You can use a for for arrays. This is kind of like Ruby's each method. "item" could be any word representing
// the element.
for(let item of todos){
    console.log(item.text)
}

// Here's a BETTER way to do array iteration.
// forEach, map (like ruby map), filter (like select)

// forEach takes a FUNCTION as the parameter. so you can write like this...
todos.forEach(function(item){
    console.log(item.text)
})


// map array. It returns an array! Might as well return it and assign it to something.
// make sure you use RETURN. It won't automatically return the last line in JS.
const todoText = todos.map(function(item){
    return item.text
})

console.log(todoText)       //['take out the trash', 'meeting with boss', 'dentist appt.']


// filter arrays. This is like select.
// Let's only return todos that have IsCompleted: true.
const todoFilterText = todos.filter(function(item){
    return item.isCompleted == true
})

console.log(todoFilterText)    // Only 2 objects returned!

// on 45 minutes...

// CONDITIONALS
// If Statements

const numx = 10

if (numx==10){
    console.log("X is 10!")
}

// Equal signs
// When using ==, it doesn't match data types. It just matches values.
// For example, if I change the numx to a string but check for number it will still be true. Bad.
const numy = 10

if (numy == 10) {
    console.log('double equals...doesnt match data types unfortunately.')
}

// However, when you use ===, it matches data type AND value. Use ===.

if (numy === 11) {
    console.log('shows if 11.')
}
else{
    console.log('not 11.')      // not 11.
}

// You can also use Else if.

if (numy === 20){
    console.log('shows if 11.')
}
else if (numy === 10){
    console.log('shows if 10.')     //shows if 10.
}
else{
    console.log('not 11.')
}

// You can also use && or ||
if (numy < 20 && numy > 9){
    console.log('its less than 20 and greater than 9')
}


// Ternary Operator
const cnum = 10;
const color = cnum > 10 ? 'red' : 'blue'
console.log(cnum)       // 10


// Switches - Same Idea as in Ruby. The default is like else fallthrough. You do need breaks for some reason.

switch(color){
    case 'red':
        console.log('color is red')
        break
    case 'blue':
        console.log('color is blue')
        break
    default:
        console.log('doesnt match anything')
        break
}

