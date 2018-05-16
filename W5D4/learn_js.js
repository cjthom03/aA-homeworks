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
