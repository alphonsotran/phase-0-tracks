// Pseudocode

// Declare a variable called "reverse" and have it store a function with a string parameter. Set a variable in the function that will take the passed string and split it into an array. Set another variable in the function that has an empty array.
// Set a 'for' loop that will start the count at the string's length. Set a conditional statement to have it be greater than -1. Set a decrement to subtract 1 from the counter each time.
// The block of the code will push each element from the array containing the split string starting from the end to the front into the empty array.
//After the loop ends, the new array containing the reversed letters of the string will be joined back into a string and returned.

var reverse = function(word) {
  var result = [];
  var word_arr = word.split('');

  for (var i=word.length - 1; i > -1; i--) {
    result.push(word_arr[i]);
  }

  return result.join('');

};



//Driver code

var reverse_result = reverse("Thanksgiving")

if (reverse_result === reverse("Thanksgiving")) {
  console.log(reverse_result + " is correct!");
}
else {
  console.log("This word does not work.");
}