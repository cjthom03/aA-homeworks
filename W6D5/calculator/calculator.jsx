import React from 'react';

const myMath = {
  '+': (x, y) => (x + y),
  '-': (x, y) => (x - y),
  '*': (x, y) => (x * y),
  '/': (x, y) => (x / y)
};

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      num1: "",
      num2: "",
      result: 0,
    };

    this.setnum1 = this.setnum1.bind(this);
    this.setnum2 = this.setnum2.bind(this);
    this.setResult = this.setResult.bind(this);
    this.clear = this.clear.bind(this);
  }

  setnum1(event) {
    this.setState({num1: event.target.value});
  }

  setnum2(event) {
    this.setState({num2: event.target.value});
  }

  setResult(event) {
    event.preventDefault();
    let num1 = Number(this.state.num1.trim());
    let num2 = Number(this.state.num2.trim());
    let result = myMath[event.target.value](num1, num2);
    this.setState({result});
  }

  clear(event) {
    event.preventDefault();
    this.setState({num1: "", num2: "", result: 0});
  }

  render(){
    return (
      <div>
        <h1>Calculate some stuff?</h1>
        <h1>{this.state.result}</h1>
        <h4>Num1:  {this.state.num1}</h4>
        <h4>Num2:  {this.state.num2}</h4>

        <input type="text" onChange={this.setnum1}
          value={this.state.num1}></input>
        <input type="text" onChange={this.setnum2}
          value={this.state.num2}></input>

        <button onClick={this.clear} value="">Clear</button>
        <br />

        <button onClick={this.setResult} value="+">+</button>
        <button onClick={this.setResult} value="-">-</button>
        <button onClick={this.setResult} value="*">*</button>
        <button onClick={this.setResult} value="/">/</button>

      </div>
    );
  }
}

export default Calculator;
