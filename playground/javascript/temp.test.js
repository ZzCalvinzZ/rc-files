const {temp, shift} = require('./temp');
const inputs = ['abc'];
const output = ['ab', 'c_'];

test('temp', () => {
	expect(temp(...inputs)).toEqual(output);
});

test('temp2', () => {
	expect(temp('abcdef')).toEqual(['ab', 'cd', 'ef']);
});
