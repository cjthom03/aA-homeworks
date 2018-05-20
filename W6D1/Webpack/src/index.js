import _ from 'lodash';

function component() {
  var element = document.createElement('div');

  // Lodash, currently included via a script, is required for this line to work
  element.innerHTML = _.json(['Hello', 'webpack'], ' '); // Lodash, now imported by this script

  return element;
}

document.body.appendChild(component());
