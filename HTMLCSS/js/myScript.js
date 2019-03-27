/*

    JavaScript

    JavaScript is the programming language of HTML and the web.
    It is used to program the behavior of web pages.
    It is 'kind of' an object-oriented programming language.
    In JS, objects:
        - are general container of property : value pairs
        - can contain other objects

    Functions are considered values
        - Can be anonymous.
        - Can be passed as a method argument. 

    EVERYTHING in JS is an Object
    Case sensitive
    Not compiled - it's interpreted
    Loosely typed - var, let
    Scripting language

    Data Types:
        Primitives
            - Number
            - String
            - Boolean
        Objects - property:value pairs
        Undefined - default for undeclared variables
        Null
        NaN
*/


var a = 3;
console.log('a is: ' + typeof(a));
a = "boo";

// object
var person = {
    firstName : 'Matt',
    lastName : 'Ruiz',
    // In a function definition, 'this' refers to the "owner" of the fn
    // 'this' is the person object, that owns the fullName fn
    fullName : function() {
        return this.firstName + " " + this.lastName;
    }
};

// In JS, a variable without a value is considered undefined.
var car;
console.log('car with no value: ' + typeof(car));
car = "";
console.log('car with value: ' + typeof(car));

// == vs ===
// == loose equality operator
console.log('== ' + (7 == '7'));
// === strict equality operator
console.log('=== ' + (7 === '7'));

// Callback functions
// A function that is to be executed after another function has
// finished executing.
//
// Functions can take function as arguments
//      - Higher-order functions

// Function parameters don't need a type specified.
// function doHomework(subject, callback) {
//     //alert('Starting my ${subject} homework'); // bad
//     var sub = "math";
//     alert(`Starting my ${sub} homework`);
//     callback();
// }

// function alertFinished() {
//     alert('Finished my homework.');
// }

// doHomework('js', alertFinished);

// Immediately Invoked Function Expression (IIFE) - Self-invoking fn
// It is a JS function that runs as soon as it is declared.
/*
    (function() {
        statements
    })();

*/

(function() {
    console.log('My name is Jeff');
})();

// Closures
// JS variables can belong to the local or global scope.
// Global variables can be made local(private) with closures.
// A closure is a function having access to the parent scope,
// even after the parent function has closed.

var add = (function() {
    var counter = 0;
    return function() { counter += 1; return counter; };
})();

function Person(){
    
    let name;
    let age;

    this.getAge = function(){
        return age;
    }
    this.setAge = function(ageInput){
        age = ageInput;
    }
    this.getName = function(){
        return name;
    }
    this.setName = function(nameInput){
        name = nameInput;
    }
}

// Truthy vs Falsey
// falsey: false/0/''/""/null/undefined/NaN
// truthy: everything else - true/'0'/'false'/[]/{}/function(){}

// Operators
//
// Default : ||
// a || b will return a if a is truthy
// Returns the first truthy value in the expression.
var a = 0;
var b = false;
console.log('default operator: ' + (a || a));

// Guard : &&
//
// If the value on the left is falsey, it is returned.
// If the value on the left is truthy, continue evaluating.
// If the last is reached, it is returned no matter what.
console.log('guard operator: ' + (0 && 1));
console.log('guard operator: ' + (1 && null && 2));
console.log('guard operator: ' + (1 && 1 && 2));

// var name = data.person.name;

// var name;
// if(data.person)
//     name = data.person.name;

// var name = data.person && data.person.name;

// Document Object Model (DOM) Manipulation
function myExternalFunction() {
    // document refers to the entire webpage.
    document.getElementById("demo").innerText = 'Hello from myScript.js';
}


function changeParagraphBackgrounds() {
    var elements = document.getElementsByClassName("paragraphs");
    for (var i = 0; i < elements.length; i++) {
        elements[i].setAttribute("style", "background-color:blue;");
    }
}

function changeFirstName(element) {
    console.log('element: ' + element);
    // get the element that we want to change
    //var element = document.getElementById("fname");
    element.value = element.value.toUpperCase();
}
