// Pseudocode
// Write a function that will loop through the array and push the length of each element to a new array. 
// The new array containing the length of each element will then give a max value using the Math.max method and assigned a new variable. 
// The new variable containing the max element will then be used to find the index in the array with the length of each element. This will be assigned a new variable.
// The new variable containing the index of the max length will then be used on the original array with the words. 

var longest_phrase = function(arr) {
	var length_arr = [];

	for (var i = 0; i < arr.length; i++){
		length_arr.push(arr[i].length);
	}

	var max_el = Math.max.apply(Math, length_arr);
	var longest_el = length_arr.indexOf(max_el);
	return arr[longest_el];
}

var test_arr = ["long phrase","aaaaaaaaaaaaaaaaaa","longest phrase", "asldkfas;ldfasldf", "longer phrase"];

console.log(longest_phrase(test_arr));