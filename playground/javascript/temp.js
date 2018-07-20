const { trace } = require('./functional');
const fp = require('lodash/fp');
function temp(str) {
	return (str.length % 2 ? str + '_' : str);
}

module.exports = { temp };
