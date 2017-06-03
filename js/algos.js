// Pseudocode

// Write a function that will loop through the array and push the length of each element to a new array.
// The new array containing the length of each element will then give a max value using the Math.max method and assigned a new variable.
// The new variable containing the max element will then be used to find the index in the array with the length of each element. This will be assigned a new variable.
// The new variable containing the index of the max length will then be used on the original array with the words.

var test_arr = ["long phrase","aaaaaaaaaaaaaaaaaa","longest phrase", "asldkfas;ldfasldf", "longer phrase"];

var longest_phrase = function(arr) {
	var length_arr = [];

	for (var i = 0; i < arr.length; i++){
		length_arr.push(arr[i].length);
	}

	var max_el = Math.max.apply(Math, length_arr);
	var longest_el = length_arr.indexOf(max_el);
	return arr[longest_el];
}

// Write a function that incorporates two object literals.
// Loop through one object's key and make a conditional statement.
// ---If object1.key is equal to object2.key, then return true. Else return fase.


var census1994 = {name: "John", age: 53, weight: 22};
var census2004 = {name: "Tamir", age: 54, weight: 22};

var match = function(object1, object2){
	for (var key in object1){
		if (object1[key] === object2[key]){
		return true;
		}
		}
		return false;
}

// Set up two variables with empty arrays. One variable where n (counter) = 1. Another variable with the alphabet in its array.
// set up a function called randomizer with one parameter (the number of letters in an array).
// Within the function, set a loop where the parameter is the limit. Set the function equals to 0.
// Within the loop, set a 'while' loop that will start counter at 1 and end at a random number assigned by Math.random(). The first loop will push a random letter from the alphabet into an empty array. This will go on until the 'while' loop closes. Afterwards, array containing the random letters will be put into a new variable where it is converted into a string.
// The new variable containing the new string will then be pushed into another empty array. The variable array containing the randomized letters will then be emptied along with the 'while' counter. The next loop will start and the process all over again.

var random_letters_arr = [];
var random_words = [];
var n = 1;
var alphabet = "abcdefghijklmnopqrstuvwxyz".split("");

var randomizer = function(int) {

  for (var i = 0; i < int; i++) {
    while ( n <= Math.floor(Math.random()*10) + 1) {
      random_letters_arr.push(alphabet[Math.floor(Math.random()*26)]);
      n++;
    }
    var random_str = random_letters_arr.join("");
    random_words.push(random_str);
    random_letters_arr = [];
    n = 1;
  }


return random_words;

}




console.log(longest_phrase(test_arr));
console.log(match(census1994, census2004));
console.log(randomizer(5));
