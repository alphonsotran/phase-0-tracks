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
	attr_reader :blankstr, :guess_count, :wordlength, :userword

	def initialize(userword)
		@userword = userword.downcase
		@guess_count = 0
		@game_over = false
		@wordarr = @userword.chars
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


#random = WordGuess.new("hello")

#p random.word_convert
#p random.blankstr
#random.guess("h")
#p random.blankstr
#random.guess("l")
#p random.blankstr
#p random.guess_count

#Driver code
#Ask user for word and initialize.
puts "Input a word to have the other person guess."
secretword = gets.chomp
random = WordGuess.new(secretword)

#Convert word to "-" form. Ask the other user to guess the word. Print the secret word in "-" form.
random.word_convert

loop do
	puts " "
	puts "#{random.blankstr}"
	puts "Guess one letter at a time."
	letter = gets.chomp
	random.guess(letter)
		if random.guess_count > random.wordlength 
			return puts "You lose!"
		else 
			random.blankstr == random.userword
			return puts "You win!"
		end 

end
#puts "Guess one letter at a time."
#letter = gets.chomp
#random.guess(letter)
#
#puts " "
#puts "#{random.blankstr}"
#puts "Guess one letter at a time."
#p random.guess_count