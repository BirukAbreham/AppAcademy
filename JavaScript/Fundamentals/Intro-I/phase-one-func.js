function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`
}

console.log(madLib('make', 'best', 'guac'))


function isSubstring(str, substr) {
  let val = str.includes(substr) ? true : false;
  return val
}

console.log(isSubstring("time to program", "time"))
console.log(isSubstring("Jump for joy", "joys"))

