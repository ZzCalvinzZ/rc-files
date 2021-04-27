interface Person {
  name: string;
}

interface Lifespan {
  birth: Date;
  death?: Date;
}

type PersonSpan = Person & Lifespan;

const ps: PersonSpan = {
  name: 'Alan Turing',
  birth: new Date('1912/06/23'),
  // death: new Date('1954/06/07'),
};

function getKey<K extends string>(val: any, key: K) {
  return {val, key}
}

getKey({}, 'x');  // OK, 'x' extends string
getKey({}, Math.random() < 0.5 ? 'a' : 'b');  // OK, 'a'|'b' extends string
getKey({}, document.title);  // OK, string extends string

/*******************************************/

interface Point {
  x: number;
  y: number;
}

interface Cool {
  a: number;
  b: number;
}
type PointKeys = keyof Point;  // Type is "x" | "y"

function sortBy<T, K extends keyof T>(vals: T[], key: K): T[] {
  return [];
}


/*******************************************/
function getUserInfo(userId: string) {
  // ...
  return {
    userId,
  };
}
// Return type inferred as { userId: string; name: string; age: number, ... }
type UserInfo = ReturnType<typeof getUserInfo>;
type It = typeof getUserInfo

/*******************************************/
interface Name {
  first: string;
  last: string;
}
type DancingDuo<T extends Name> = [T, T];

const couple1: DancingDuo<Name> = [
  {first: 'Fred', last: 'Astaire'},
  {first: 'Ginger', last: 'Rogers'}
];  // OK

const couple2 = [
  {first: 'Sonny'},
  {first: 'Cher'}
];
/*******************************************/
