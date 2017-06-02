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

// Write a function that incorporates two objects. The objects will pass through the conditional statement for
// each property comparing it to each other (||). If true, then return true. If nothing compares, then return false.

var census1994 = {name: "Steven", age: 54};
var census2004 = {name: "Tamir", age: 54};

var match = function(object1, object2){
	if (object1.name === object2.name || object1.age === object2.age) {
	return true;
	} else {
	return false;
	}
}

// Set up two variables with empty arrays. One variable where n (counter) = 1. Another variable with the alphabet in its array.
// set up a function called randomizer with one parameter (the number of letters in an array).
// Within the function, set a loop where the parameter is the limit. Set the function equals to 0.
// Within the loop, set a 'while' loop that will start counter at 1 and end at a random number assigned by Math.random(). The first loop will push a random letter from the alphabet into an empty array. This will go on until the 'while' loop closes. Afterwards, array containing the random letters will be put into a new variable where it is converted into a string.
// The new variable containing the new string will then be pushed into another empty array. The variable array containing the randomized letters will then be emptied along with the 'while' counter. The next loop will start and the process all over again.





console.log(longest_phrase(test_arr));
console.log(match(census1994, census2004));
