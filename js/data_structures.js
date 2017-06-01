var colors = ["red", "green", "blue", "yellow"];
var names = ["Ed", "Hilbert", "Unicorn", "Pony"];
var horses = {};

colors.push("purple");
names.push("Alex");

console.log(colors);
console.log(names);

for (var i = 0; i < colors.length; i++) {
  horses[names[i]] = colors[i];
}

console.log(horses);