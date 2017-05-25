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
	attr_reader :blankstr, :guess_count

	def initialize(userword)
		@userword = userword
		@guess_count = 0
		@game_over = false
		@wordarr = userword.chars
		@blankarr = []
		@wordlength = @userword.length
	end

	#def word_length
	#	@wordlength = @userword.length
	#end

	def word_convert
		@wordlength.times do |x|
			@blankarr << "-"
		end
		@blankstr = @blankarr.join.to_s
	end

	def guess(letter)
		@guess_count += 1
		@wordarr.each_index do |idx|
			if @wordarr[idx] == letter
				@blankarr.delete_at(idx)
				@blankarr.insert(idx, letter)
			end
		end
		@blankstr = @blankarr.join.to_s
	end

end


random = WordGuess.new("hello")

p random.word_convert
p random.blankstr
random.guess("h")
p random.blankstr
random.guess("l")
p random.blankstr
p random.guess_count