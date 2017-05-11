
#Defining a method that increases each letter of the string by one.
#def encrypt(word)
#	#Initialized the counter outside the loop.
#	i = 0
#	#Iterating through each index until it matches the given word length.
#	until i == word.length
#		#Printing the incremented letter following each index.
#		next_word = word[i].next 
#		if next_word[i] == "aa"
#			print word[i-1].next
#		else 
#			print word[i].next
#		end
#		
#			 
#		#Incrementing the counter by one.
#		i += 1 
#	#Closes the loop.	
#	end
##Closes the scope of the method.	
#end


#OUR METHOD DECLARATIONS

#Defining a method that increases each letter of the string by one.
def encrypt(word)
	#Defining variables.
	words_str = ""
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	#Initialized the counter outside the loop.
	i = 0
	#Iterating through each index until it matches the given word length.
	until i == word.length
		#Shoving the incrementing letter following each index into variable.
		words_str << alphabet[((alphabet.index(word[i]))+1) % 26]
		#Incrementing the counter by one.
		i += 1
	#Closes the loop.	
	end
words_str
#Closes the scope of the method.	
end


#Defining a method that decreases each letter of the string by one. 
def decrypt(word)
	#Defining variables.
	words_str = ""
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	#Initialized the counter outside the loop.
	i = 0
	#Iterating through each index until it matches the given word length.
	until i == word.length
		#Shoving the decrementing letter following each index into variable. 
		words_str << alphabet[((alphabet.index(word[i]))-1) % 26]
		#Incrementing the counter by one.
		i += 1
	#Closes the loop.	
	end
words_str
#Closes the scope of the method.	
end

#Defines a method that chooses the path of the user. 
def pickone(password_b, password)
	if password_b == "encrypt"
		puts encrypt(password)
	else 
		puts decrypt(password)
	end 
end


puts encrypt("abc")
puts encrypt("zed")
puts decrypt("bcd")
puts decrypt("afe")

#The encrypt method gave us an implicit return to pass onto the decrypt method as an argument.
puts decrypt(encrypt("swordfish")) 




#DRIVER CODE.

#Ask user if they want to decrypt or encrypt.
puts "Would you like to encrypt or decrypt the password?"
	password_b = gets.chomp
#Ask user to enter password.
puts "Enter your password."
	password = gets.chomp
#Call method with the two arguments.
puts pickone(password_b, password)
	
