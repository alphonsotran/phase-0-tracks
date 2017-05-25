#Pseduocode

#Create a 'WordGuess' class. Include methods:

#Method that initializes and adds appropriate user input into instance variable downcase. Set instance variables for guess_count at user's inputted word's length and array. Set up instance variable with blank array.

#Method that converts each word to "-" by iterating through array of words and replace with "-"

#Method that iterates over word array and replaces "-" with appropriate index of the correct word. Decrement guess_count by one if guessed incorrectly. Converts array back to string.
#
#Driver code
#Congratulatory message if guessed correctly before guess_count is equal to zero. Taunting message if guess_count is equal to zero.


class WordGuess
	attr_reader :blankstr, :guess_count, :wordlength, :userword
	attr_accessor :game_over

	def initialize(userword)
		@userword = userword.downcase
		@guess_count = userword.length
		@wordarr = @userword.chars
		@game_over = false
		@blankarr = []
		@wordlength = @userword.length
	end

	def word_convert
		@wordlength.times do |x|
			@blankarr << "-"
		end
		@blankstr = @blankarr.join.to_s
	end

	def guess(letter)
		@wordarr.each_index do |idx|
			if @wordarr[idx] == letter.downcase
				return if letter.downcase == @blankarr[idx]
				@blankarr.delete_at(idx)
				@blankarr.insert(idx, letter.downcase)
			end
		end
		@guess_count -= 1
		@blankstr = @blankarr.join.to_s
	end

end


#Driver code
#Ask user for word and initialize.
puts "Input a word to have the other person guess."
secretword = gets.chomp
random = WordGuess.new(secretword)

#Convert word to "-" form. Ask the other user to guess the word. Print the secret word in "-" form.
random.word_convert

#Create a loop asking for a letter until countdown = 0 or guessed word correctly.
loop do
	sleep(0.4)
	puts " "
	puts "Word to guess: #{random.blankstr}"
	puts "Guess one letter at a time. Tries remaining: #{random.guess_count}"
	letter = gets.chomp
	random.guess(letter)
		if random.blankstr == random.userword
			puts " "
			puts "The secret word is '#{random.userword}'"
			puts "Congratulations! You a winner!"
			break
		elsif random.guess_count == 0
			puts " "
			puts "Ha ha. You lose, loser!"
			puts "The secret word is '#{random.userword}'"
			break
		else
			next
		end
end
