const { trace } = require('./functional');
const fp = require('lodash/fp');
const shift = x => fp.concat(fp.take(1, x), x);
function temp(str, sz) {
  return fp.compose(
    fp.map(
      arr =>
        fp.sum(fp.map(x => Math.pow(x, 3)), arr) % 2
          ? fp.reverse(arr)
          : shift(arr)
    ),
    fp.filter(x => x.length === sz),
    fp.chunk(sz)
  );
}

module.exports = { temp, shift };
