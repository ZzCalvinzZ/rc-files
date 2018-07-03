const {temp, shift} = require('./temp');
const inputs = ['733049910872815764', 5];
const output = '330479108928157';

test('temp', () => {
	expect(temp(...inputs)).toBe(output);
});

test('shift', () => {
	console.log(shift);
	expect(shift([1,2,3])).toBe([2,3,1]);
});
