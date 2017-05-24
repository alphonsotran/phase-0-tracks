class Puppy
  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(num)
    counter = 0
    while counter < num
      puts "woof"
      counter += 1
    end
  end

  def roll_over
    puts "*Rolls over*"
  end

  def dog_years(human_yrs)
    human_yrs * 7
  end

  def pee_itself
    puts "*Wets self*"
  end

  def initialize
    puts "Initializin new puppy instance..."
  end

end

spot = Puppy.new
spot.fetch("ball")
spot.speak(4)
spot.roll_over
p spot.dog_years(12)
spot.pee_itself

class Kitten

  def scratch
    puts "Ouch! He scratched me."
  end

  def sleep
    puts "Oh look, he's sleeping."
  end

end

counter = 0

cat_array = []
while counter < 50
  name = counter
  cat_array << name = Kitten.new
  counter = counter + 1
end


p cat_array

cat_array.each do |x|
  x.scratch
  x.sleep
end

