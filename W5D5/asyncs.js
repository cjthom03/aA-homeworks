const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

//This is Wrong
// function teaAndBiscuitsFromRudeHost () {
//   let first, second;
//
//   reader.question('Would you like some tea?', (res) => {
//     first = res;
//     console.log(`You replied ${res}.`);
//   });
//
//   reader.question('Would you like some biscuits?', (res) => {
//     second = res;
//     console.log(`You replied ${res}.`);
//   });
//
//   const firstRes = (first === 'yes') ? 'do' : 'don\'t';
//   const secondRes = (second === 'yes') ? 'do' : 'don\'t';
//   console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
//   reader.close();
// }


function teaAndBiscuits () {
  reader.question('Would you like some tea? ', function(first){
    console.log(`You replied ${first}.`);
    reader.question('Would you like some biscuits? ', function(second) {
      console.log(`You replied ${second}.`);
      const firstRes = (first === 'yes') ? 'do' : 'don\'t';
      const secondRes = (second === 'yes') ? 'do' : 'don\'t';
      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });
}


teaAndBiscuits();
