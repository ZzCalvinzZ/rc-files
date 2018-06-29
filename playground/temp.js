const { trace } = require('./functional');
const fp = require('lodash/fp');
const test = 'aabBcde';

function duplicateCount(text) {
	let str = fp.toLower(text);
	let count = fp.compose(
		x => x.length,
		fp.filter(x => x > 1),
		fp.map(x => str.split(x).length - 1),
		fp.uniq
	);
	return count(str);
}

duplicateCount(test);
