// Mystery Scoping with var, let, const
// Test out each of following functions in Node.
// What does each log to the console?
// Do any of them throw errors? See if you can figure out why.

function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log('1 ' + x);
  }
  console.log('2 ' + x);
}
// Returns
  // '1 in block'
  // '2 in block'

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log('1 ' + x);
  }
  console.log('2 ' + x);
}
// Expect function to throw an error => trying to reassign constant
// WRONG ... Function Returns
  // '1 in block'
  // '2 out of block'
// So var reassigned the variable in both the function and if blocks
// while const defined two different variables in each block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log('1 ' + x);
  }
  console.log('2 ' + x);
}
// Expect '1 in block', '2 out of block'
// WRONG
// SyntaxError: Identifier 'x' has already been declared
// So const's can be defined on the same variable in different scopes,
// but var cannot try to override a const



function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log('1 ' + x);
  }
  console.log('2 ' + x);
}
// Expect '1 in block' and '2 out of block'
//CORRECT! YAY!

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log('1 ' + x);
  }
  let x = 'out of block again';
  console.log('2 ' + x);
}

// Expect '1 in block' and '2 out of block again'
// WRONG
// SyntaxError: Identifier 'x' has already been declared
// Let seems to function similar to const in that it cannot be redefined in the same scope?



// Write a function that takes three strings - a verb, an adjective,
// and a noun - uppercases and interpolates them into the sentence
// "We shall VERB the ADJECTIVE NOUN".
// Use ES6 template literals.

function madlib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`
}


function isSubString(searchString, subString) {
  // return searchString.indexOf(subString) >= 0;
  return searchString.includes(subString);
}


// fizzBuzz
// 3 and 5 are magic numbers.
//
// Define a function fizzBuzz(array) that takes an array and returns
// a new array of every number in the array that is divisible by
// either 3 or 5, but not both.

// my solution
function fizzBuzz(array) {
  let result = [];
  for(let i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 && array[i] % 5 === 0) {
      continue;
    } else if (array[i] % 3 === 0 || array[i] % 5 === 0)
      result.push(array[i]);
  }
  return result;
}
// their solotion
function fizzBuzz (array) {
  const fizzBuzzArr = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzBuzzArr.push(el);
    }
  });


  // isPrime
  // Define a function isPrime(number) that returns true if number is prime.
  // Otherwise, false. Assume number is a positive integer.

function isPrime(number) {
  if (number <= 1) {
    return false;
  }
  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}


// sumOfNPrimes
// Using firstNPrimes, write a function sumOfNPrimes(n) that returns the
// sum of the first n prime numbers. Hint: use isPrime as a helper method.

function sumOfNPrimes(n) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;
  while (countPrimes < n) {
    if (isPrime(i)){
      sum += i;
      countPrimes++;
    }
    i++;
  }
  return sum;
}

/////////////////////////////////////////////////////////////////////

// Write a function titleize that takes an array of names and a function
// (callback). titleize should use Array.prototype.map to create a new
// array full of titleized versions of each name - titleize meaning "Roger"
// should be made to read "Mx. Roger Jingleheimer Schmidt". Then pass this
// new array of names to the callback, which should use
// Array.prototype.forEach to print out each titleized name.
//
  // > titleize(["Mary", "Brian", "Leo"], printCallback);
    // Mx. Mary Jingleheimer Schmidt
    // Mx. Brian Jingleheimer Schmidt
    // Mx. Leo Jingleheimer Schmidt
    // undefined


  function printCallback(element) {
    console.log(element);
  };

  function titleize(array, callback) {
    let titles = array.map(el => `Mx. ${el} Jingleheimer Schmidt`);
    titles.forEach(el => callback(el))
  };

// my invocation of function
  titleize(["Mary", "Brian", "Leo"], printCallback);


/////////How they did it

  function titleize(array, callback) {
    let titles = array.map(el => `Mx. ${el} Jingleheimer Schmidt`);
    callback(titles);
  };

  titleize(["Mary", "Brian", "Leo"], (names) => {
  names.forEach(name => console.log(name));
});



/////////////////////////////////////////////////////////////////////



// First write a constructor function for an elephant.
// Each elephant should have a name, height (in inches), and array of
// tricks in gerund form (e.g. "painting a picture" rather
// than "paint a picture").
//
// Next write a few prototype functions that will be shared among all elephants:
//
// Elephant.prototype.trumpet: should print "(name) the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"
// Elephant.prototype.grow: should increase the elephant's height by 12 inches
// Elephant.prototype.addTrick(trick): add a new trick to their existing repertoire
// Elephant.prototype.play: print out a random trick, e.g. "(name) is (trick)!"
// Hint: look up some JS Math methods!
// Make sure to create an elephant and test all of these functions out on them method style!


function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
  this.paradeHelper = function() {
    console.log(`${this.name} is trotting by!`);
  };
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR'`);
}

Elephant.prototype.grow = function () {
  return this.height += 12;
}

Elephant.prototype.addTrick = function (trick) {
  return this.tricks.push(trick);
}

Elephant.prototype.play = function () {
  let trickNum = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[trickNum]}`);
}

// Elephant.paradeHelper = function(elephant) {
//   console.log(`${elephant.name} is trotting by!`);
// };


let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];




// Now let's create a function called paradeHelper that we'll use to
// have an elephant parade. It should take a single elephant as an
// argument; this way, we can pass it as a callback to forEach when
// called on our herd. Make sure to store it as a property on the
// Elephant object. You can populate it with any console.log statement
// you want to build your parade (e.g. "_______ is trotting by!").
//
// For example:
//
// > Elephant.paradeHelper(micah);
// Micah is trotting by!
// undefined
// Once you have this function, call forEach on the herd and pass
// it in as the callback without invoking it. Elephants galore!

herd.forEach(el => el.paradeHelper());


// Let's make a function dinerBreakfast. Ultimately, we want it to return
// an anonymous closure, which we will be able to use to keep adding
// breakfast foods to our initial order.
//
// > let bfastOrder = dinerBreakfast();
    // "I'd like cheesy scrambled eggs please"
// > bfastOrder("chocolate chip pancakes");
    // "I'd like cheesy scrambled eggs and chocolate chip pancakes please."
// > bfastOrder("grits");
    // "I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please."

// Hints:
//
// order should be initialized to a starting order
    // (e.g. scrambled eggs and bacon) before the anonymous function can do its work.
// The closure should capture/close over order
// What should the return value of dinerBreakfast be?
// Which function should take in the additional food as an argument?
// Make sure you can call it multiple times and keep chaining on more breakfast foods!

function dinerBreakfast() {
  let order = "I'd like eggs-bakie please";
  console.log(order);

  return function(newOrder) {
    order = `${order.slice(0, order.length - 8)} and ${newOrder} please.`;
    console.log(order);
  };
}
