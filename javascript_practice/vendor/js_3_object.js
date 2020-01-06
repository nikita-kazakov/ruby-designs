// JavaScript Crash Course - Objects
// https://www.youtube.com/watch?v=hdI2bqOjy3c
// January 2020

// Let's talk about Object Literals. It's simply a hash with a key and value pairs. Easy.
// Notice you can put ANY data types for values for keys in object.
// We even put an object (address) inside an object. This is where JSON comes from.

const person = {
    firstName: "Jim",
    lastName: "Black",
    age: 30,
    hobbies: ['music', 'movies', 'sports'],
    address: {
        street: '50 denver st.',
        city: "Denver",
        state: 'MA'
    }
}

console.log(person)             // see the entire object in console. browse it.
console.log(person.firstName)   // Jim

// Pop Quiz! Let's say you want to get that second element from hobbies in the person object.
let second_element = person.hobbies[1]
console.log(second_element)     // movies

// Pop Quiz #2 - Okay give me the city from the address in the person object.
console.log(person.address.city)// boston


// You can also pull out variables out of an object like this:
// This is called DESTRUCTURING. It is part of ES6.
const {firstName_a, lastName_a} = person;
console.log(firstName_a, lastName_a)  // Jim Black

// You don't have to do it this way, you could do it the old fashioned way like this.
// This is way more understandable actually.
let first_nameb = person.firstName
let last_nameb = person.lastName
console.log(first_nameb + last_nameb)  //Jim Black

// You can also ADD properties.
person.email = "john@gmail.com"
console.log(person.email)              // john@gmail.com


// You're going to be dealing with ARRAY of objects many times. Let's look.
// Let's create todos object.

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

// In the console, you'll see an ARRAY of OBJECTS.
console.log(todos)

// Pop Quiz #4. Go ahead and grab the text "meeting with boss" in the console.
console.log(todos[1].text)


// JSON. It's a data format. It's similar to object-literal format you see above.
// The main difference is in JSON you have double quotes on the keys and
// double quotes on the strings.


// Let's say we want to convert our todos object into a JSON file so we can send it to a server.
const todoJSON = JSON.stringify(todos)
// Let's see how the JSON of that looks like!
console.log(todoJSON)



