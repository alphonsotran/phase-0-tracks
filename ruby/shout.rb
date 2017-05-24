#module Shout
#  def self.yell_angrily(words)
#    words + "!!!" + " :("
#  end
#
#  def self.yelling_happily(words)
#  	words + "!!!" + " :)"
#  end
#end
#
#
##Driver Code
##Release 1
#puts Shout.yell_angrily("Yesss")
#puts Shout.yelling_happily("Yesss")

module Shout

	def cry
		puts "WAAAAAAA"
	end 

	def tantrum
		puts "*Throws a fit*"
	end

end

class Monkey
	include Shout
end

class Human_Baby
	include Shout
end 

#Driver Code

chimp = Monkey.new
chimp.cry
chimp.tantrum

baby = Human_Baby.new
baby.cry
baby.tantrum