# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

def swapcase
"iNvEsTiGaTiOn".swapcase
end

#=> “InVeStIgAtIoN”

def gsub
 puts "zom".gsub(/[m]/, "om")
end
#=> “zoom”

def center
 "enhance".center(16)
end
#=> "    enhance    "

def upcase
  "Stop! You’re under arrest!".upcase
end
#=> "STOP! YOU’RE UNDER ARREST!"

def ljust
  "the usual".ljust(18, " suspects")
end
#=> "the usual suspects"

def rjust
  " suspects".rjust(18, "the usual")
end
#=> "the usual suspects"

def chop
  "The case of the disappearing last letter".chop
end
#=> "The case of the disappearing last lette"

def slice
  "The mystery of the missing first letter".slice(1..-1)
end
#=> "he mystery of the missing first letter"

def squeeze
  "Elementary,    my   dear        Watson!".squeeze
end
#=> "Elementary, my dear Watson!"

def bytes
  "z".bytes
end
puts bytes #=> 122
 #(What is the significance of the number 122 in relation to the character z?)
 #Changes string letter to character code ASCII

def count
  "How many times does the letter 'a' appear in this string?".count"a"
end
#=> 4


puts swapcase
puts gsub
puts center
puts upcase
puts ljust
puts rjust
puts chop
puts slice
puts squeeze
puts count