function namedAs(value, fn) {
  Object.defineProperty(fn, 'name', { value });
  return fn;
}

function curry(fn) {
  const arity = fn.length;

  return namedAs(fn.name, function $curry(...args) {
    $curry.partially = this && this.partially;

    if (args.length < arity) {
      return namedAs(fn.name, $curry.bind({ partially: true }, ...args));
    }

    return fn.call(this || { partially: false }, ...args);
  });
}

const trace = curry((tag, x) => {
  console.log(tag, x);
  return x;
});

module.exports = {
	trace
};
