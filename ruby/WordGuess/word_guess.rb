#Pseduocode
#
#Create a 'WordGuess' class. Include methods:
#
#Method that initializes and adds appropriate user input into instance variable. Set default instance values for guess_count at 0 and game_over at false.  
#
#Method that counts length of word
#
#Method that converts each word to "-"
#
#Method that iterates over word array and replaces "-" with appropriate index of the correct word.
#	Increments by one if guessed incorrectly.
#
#Driver code
#Congratulatory message if guessed correctly under guess_count. Taunting message if above guess_count counter.


class WordGuess

	def initialize(userword)
		@userword = userword
		@guess_count = 0
		@game_over = false
		@wordarr = []
		@wordlength = @userword.length
	end

	def word_length
		@wordlength = @userword.length
	end

	def word_convert(num)
		(0...@wordlength).times do |x|
			@wordarr << "-"
		end
	end

end


random = WordGuess.new("hello")

