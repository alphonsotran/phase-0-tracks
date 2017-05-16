#5.5 Solo Challenge

#Pseudocode:
#Split name into array and swap first and last name (.reverse).
#Merge array into string and split again through split('') where every single letter is now part of an array.
#Make a new method that will change consonants from current to next.
#Make a new method that will change vowel from current to next on the list of "aeiou".
#Chain the new method where they are passed as an argument from one to the other.
#Merge name from array into string.


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
#  chosen = []
#  chosen << alphabet[((alphabet.index(element)+1)%26)]
#  chosen
#end


#Method 2
def fake_name_gen(username)
alphabet = ("a".."z").to_a
vowels = ["a", "e", "i", "o", "u"]
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
	    new_username << alphabet[((alphabet.index(el)+1)%26)]
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