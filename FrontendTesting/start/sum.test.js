import { sum } from './sum.js';

describe('Sum', () =>{
  it("adds 1 and 3 to get 4", () => {
    expect(sum(1,3)).toBe(4);
    expect(sum(1,3)).not.toBe(100);
  });
});

test('Truthiness', () => {
  expect(false).toBeFalsy();
  expect(true).toBeTruthy();
});
