module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
  	words + "!!!" + " :)"
  end
end


#Driver Code
#Release 1
puts Shout.yell_angrily("Yesss")
puts Shout.yelling_happily("Yesss")