#Ask user info about and store in hash and then print
  #-name
  #-age: to integer
  #-number of children: to integer
  #-decor theme
  #-favorite color
  #-likes sunlight: boolean
#Ask user "Do you need to make any updates?"
  # if yes, then allow update based on which key. Use to_symbol (cases)
  # if "none", then proceed
#Print updated version

designer_info = {}


#Driver code
puts "Please enter your fullname."
designer_info[:name] = gets.chomp

puts "What is your age?"
designer_info[:age] = gets.to_i

puts "How many children do you have?"
designer_info[:children] = gets.to_i

puts "What is your favorite decor theme?"
designer_info[:decor] = gets.chomp

puts "What is your favorite color?"
designer_info[:color] = gets.chomp

puts "Do you like sunlight?"
sun = gets.chomp

  case sun
    when "yes", "y"
     designer_info[:sun] = true
    when "no", "n"
      designer_info[:sun] = false
  end

puts designer_info

puts "Do you need to make any updates to your application?"
updates = gets.chomp

  case updates
    when "yes", "y", "yup"
      puts "Which section do you need to make a change to?"
        changes = gets.chomp.to_sym
          case changes
            when :name
              puts "Enter fullname."
              designer_info[:name] = gets.chomp
              puts "Great. Here is your information again."
              puts designer_info
            when :age
              puts "Enter your new age."
              designer_info[:age] = gets.to_i
              puts "Great. Here is your information again."
              puts designer_info
            when :children
              puts "Enter your new amount of children."
              designer_info[:children] = gets.to_i
              puts "Great. Here is your information again."
              puts designer_info
            when :decor
              puts "Enter your favorite new, fad decor."
              designer_info[:decor] = gets.chomp
              puts "Great. Here is your information again."
              puts designer_info
            when :color
              puts "Enter your new color."
              designer_info[:color] =gets.chomp
              puts "Great. Here is your information again."
              puts designer_info
          end
    when "no", "none"
      puts "Great. Here is your information again."
      puts designer_info
  end


