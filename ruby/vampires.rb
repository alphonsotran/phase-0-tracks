

puts "How any employees will be processed?"
employees = gets.to_i
sleep(0.5)

employee_count = 0
until employee_count == employees

	puts "What's your name?"
		name = gets.chomp
	puts "How old are you?"
		age = gets.to_i
	puts "What year were your born?"
		years = gets.to_i
	puts "Our company cafeteria serves garlic bread. Should we order some for you?"
		garlic_bread = gets.chomp
	puts "Would you like to enroll in the company's health insurance?"
		health = gets.chomp
	puts "Type out your allergies one by one."
		allergy = gets.chomp

		until allergy == "done" || allergy == "sunshine"
			puts "Type out your allergies one by one."
			allergy = gets.chomp
		end

		actual_age = 2017 - years
		if actual_age != age 
			then age_told = false
		else
			age_told = true
		end

		case garlic_bread
		when "y", "yes", "Yes", "true" then garlic_bread = true
		when "n", "no", "No", "false" then garlic_bread = false
		end 	

		case health
		when "y", "yes", "Yes", "true" then health = true
		when "n", "no", "No", "false" then health = false
		end 	

		if allergy == "sunshine"
			puts "Probably a vampire."
		elsif name == "Drake Cula" || name == "Tu Fang"
			puts "Definitely a vampire."
		elsif age_told == false && garlic_bread == false && health == false
			puts "Almost certainly a vampire."
		elsif	age_told == true && (garlic_bread == true || health == true)
			puts "Probably not a vampire."
		elsif age_told == false && (garlic_bread == false || health == false)
			puts "Probably a vampire."
		else 
			puts "Results inconclusive."
		end 

	sleep(0.5)
	employee_count += 1
end

sleep(1)
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."