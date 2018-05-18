function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat ();
const Noodles = new Dog ();


//call method style
Noodles.chase(Markov)

//using the call function
Noodles.chase.call(Markov, Noodles)
Noodles.chase.call(Noodles, Noodles)

//using the apply function
Noodles.chase.apply(Markov, [Noodles])
