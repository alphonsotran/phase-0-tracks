#5.5 Solo Challenge

#Pseudocode:
#Set up alphabet, vowel, and empty array variables.
# 	-iterate alphabet and reject vowels and put into consonants variable.
#Downcase, split name into array, swap first and last name, join array into string, and split string into array again.
#Iterate through each word with conditions comparing the vowels, consonants, and empty space. 
# 	-if vowels or consonants match, increment by one and then shove into empty variable.
# 	-if string space is detected, shove string space into empty variable.
#Merge new variable with shoved elements from array into string. Split into two separate arrays separated by space, then iterate to capitalize first word. Merge into string by joining space once more.


#Smaller Methods
#def fake_name_gen(username)
#vowels = ["a", "e", "i", "o", "u"]
#new_username = []
#	mod_username = username.downcase.split.reverse.join(' ').split('')
#	mod_username.each do |el|
#	  if el == " "
#	    new_username << el
#	  elsif vowels.include?(el)
#			new_username << next_vowel(el)
#	  else 
#	    new_username << next_consonant(el) 
#	  end
#	end
#spy_name = new_username.join('').split.map {|x| x.capitalize}.join(' ')
#end 
#
#
#
#def next_vowel(element)
#  vowels = ["a", "e", "i", "o", "u"]
#  chosen = []
#  vowels.each_with_index do |el2, idx|
#			chosen << vowels[(idx+1)%5] if element == el2 
#	end
#  chosen
#end
#
#def next_consonant(element)
#  alphabet = ("a".."z").to_a
#  consonants = alphabet.reject {|x| "aeiou".include?(x)}
#  chosen = []
#  chosen << consonants[((consonants.index(element)+1) % consonants.length)]
#  chosen
#end


#Method 2
def fake_name_gen(username)
	alphabet = ("a".."z").to_a
	vowels = ["a", "e", "i", "o", "u"]
	consonants = alphabet.reject {|x| "aeiou".include?(x)}
	new_username = []
		mod_username = username.downcase.split.reverse.join(' ').split('')
		mod_username.each do |el|
		  if el == " "
		    new_username << el
		  elsif vowels.include?(el)
				vowels.each_with_index do |el2, idx|
					if el == el2 
				    	new_username << vowels[(idx+1)%5] 
					else 
				    	next
					end
		    	end
		  else 
		    new_username << consonants[((consonants.index(el)+1) % consonants.length)]
		  end
		end
	spy_name = new_username.join('').split.map {|x| x.capitalize}.join(' ')
end 



#Driver code
puts "Please enter your real name to generate a fake name. Type 'quit' to exit."
userinput = gets.chomp
fakeinput = fake_name_gen(userinput)

puts "Your spy name is #{fakeinput}." unless userinput == "quit"
list_names = {}
list_names[userinput] = fakeinput unless userinput == "quit"

	until userinput == 'quit'
		puts "Please enter your real name to generate a fake name. Type 'quit' to exit."
		userinput = gets.chomp
		fakeinput = fake_name_gen(userinput)
		puts "Your spy name is #{fakeinput}." unless userinput == "quit"
		list_names[userinput] = fakeinput unless userinput == "quit"
	end 

list_names.each {|k, v| puts "#{v} is the spy name of #{k}."}