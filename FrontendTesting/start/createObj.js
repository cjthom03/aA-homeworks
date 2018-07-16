export const createObj = (keys, vals) => {
  let returnObj = {};
  keys.forEach( (key, idx) => {
    returnObj[key] = vals[idx];
  });
  return returnObj;
};
