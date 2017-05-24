class Santa

  def speak
    puts "Ho, ho ho! Haaaappy Holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end

  def initialize(name, gender, ethnicity, weight)
    puts "initializing Santa instance ..."
    @name = name
    @gender = gender
    @ethnicity = ethnicity
    @age = 0
    @weight = weight
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
  end

  def about
    puts "Name: #{@name}"
    puts "Gender: #{@gender}"
    puts "Ethnicity: #{@ethnicity}"
    puts "Age: #{@age}"
    puts "Weight: #{@weight}"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
    @reindeer_ranking.each do |x|
     if x == reindeer_name
       @reindeer_ranking.delete(x)
       @reindeer_ranking.push(x)
     else
       next
     end
    end
    @reindeer_ranking
  end

# setter method
  def gender=(new_gender)
    @gender = new_gender
  end

# getter method
  def age
    @age
  end

  def gender
    @gender
  end

  def ethnicity
    @ethnicity
  end

  def reindeer_rank
    @reindeer_ranking
  end
end

# DRIVER CODE

# Release 0
#drunk_santa = Santa.new
#drunk_santa.speak
#drunk_santa.eat_milk_and_cookies("Snickerdoodle")

# Release 1
#santas = []
#
#
#santas << Santa.new("Mickey", "agender", "black", 150)
#santas << Santa.new("Jackie", "female", "Latino", 140)
#santas << Santa.new("James", "bigender", "white", 200)
#santas << Santa.new("Leon", "male", "Japanese", 180)
#santas << Santa.new("Trinity", "female", "prefer not to say", 105)
#santas << Santa.new("Leah", "gender fluid", "Mystical Creature (unicorn)", 250)
#santas << Santa.new("Unk", "N/A", "N/A", 175)
#
#santas.each do |santa|
#  santa.about
#  puts "----"
#end

# Release 2
santa_m = Santa.new("Mickey", "agender", "black", 150)

# Increment birthday by one
santa_m.celebrate_birthday
puts "Santa is #{santa_m.age} years old!"
# Change gender to female
santa_m.gender = "female"
puts "Santa is now #{santa_m.gender}"
# Move reindeer to end of ranking
p santa_m.get_mad_at("Dasher")

# Release 3
