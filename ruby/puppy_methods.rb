class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(n)
    n.times {|x| puts "Woof!"}
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(n)
    dog_yrs = n * 7
    puts "The dog is #{dog_yrs} years old."
  end

  def play_dead
    puts "...."
  end

  def initialize
    puts "Initializing new puppy instance ..."
  end

end

class Kitty

  def initialize
    puts "Initializing new kitten instance..."
  end

  def ball_of_string
    puts "Kitten accidentally scratched you!"
  end

  def lives_left
    puts "Kitten always has 9 lives."
  end

end

## Driver Code
## Creates new instance
#sparky = Puppy.new
#
## calls an instance method .fetch
#puts sparky.fetch("bone")
#
## calls an instance method .speak
#puts sparky.speak(4)
#
## calls an instance method .roll_over
#puts sparky.roll_over
#
## calls an instance method .dog_years
#puts sparky.dog_years(2)
#
## calls an instance method .play_dead
#puts sparky.play_dead

hk_arr = []
50.times do |i|
  kitten_i = Kitty.new
  hk_arr << kitten_i
end

def test(arr)
  arr.each do |x|
    x.ball_of_string
    x.lives_left
  end
end

puts test(hk_arr)