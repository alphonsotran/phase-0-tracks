random = [1, 4, 22, 35, 66, 200, 13]

def search_arr(arr, num)
  arr.each_index do |idx|
    if arr[idx] == num
      return idx
    end
  end
  return "nil"
end

puts search_arr(random, 44)


def fibonacci(num)
fib_array = [0, 1]
  (num-2).times do
   fib_array << fib_array[-2..-1].reduce(:+)
  end
fib_array
end

puts fibonacci(100)

#Release 2 Pseudocode
#Set up a loop with a variable in it set to false.
#Wrap a method witin that loop that iterates through the length of the array comparing one index to the next. (.times?, .each?)
# => if the first index is larger than the second index, swap positions. Change variable to true so that the loop will continue.
# => if the first index is smaller than the second index, do nothing.
#Break the loop once no other items in the array can be sorted. Return sorted array.

def bubble(arr)
mod_arr = arr.length
  loop do
    switch = false
    (mod_arr-1).times do |el|
      if arr[el] > arr[el+1]
        arr[el], arr[el+1] = arr[el+1], arr[el]
        switch = true
      end
    end
    break if switch == false
  end
arr
end

puts bubble(random)