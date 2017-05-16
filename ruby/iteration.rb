
#Release 1
personal_info = {
  name: "George McDonald",
  address: "123 Count St.",
  city: "Los Angeles",
  age: 65,
  color: "blue"
}

food = [
  "French Fries",
  "Pizza",
  "Hamburgers with bacon",
  "Sushi"
]



def iterate_hsh(par1)
  par1.each do |k, v|
    puts "This person's #{k} is #{v}."
  end
end

def iterate_arr(par1)
  par1.each do |x|
    puts "I love #{x}!"
  end
end

def iterate_arr_map(par1)
  par1.map! do |x|
    puts "I love #{x}!"
  end
end


puts iterate_hsh(personal_info)
puts personal_info

puts iterate_arr(food)
puts food

puts iterate_arr_map(food)
puts food


#Release 2
favorite_things = {
  color: "red",
  animal: "pig",
  drink: "beer",
  food: "pizza"
}


animals = [
  "dog",
  "cat",
  "bird",
  "chinchilla",
  "turtle"
]


def arr_reject
animals = [
  "dog",
  "cat",
  "bird",
  "chinchilla",
  "turtle"
]
  animals.reject do |x|
   x.length < 4
  end
end

def hsh_reject
favorite_things = {
  color: "red",
  animal: "pig",
  drink: "beer",
  food: "pizza"
}
  favorite_things.reject do |k, v|
    v.length < 4
  end
end

def arr_keep_if
animals = [
  "dog",
  "cat",
  "bird",
  "chinchilla",
  "turtle"
]
  animals.keep_if do |x|
    x.length < 4
  end
end

def hsh_keep_if
favorite_things = {
  color: "red",
  animal: "pig",
  drink: "beer",
  food: "pizza"
}
  favorite_things.keep_if do |k, v|
    v.length < 4
  end
end

def arr_select
animals = [
  "dog",
  "cat",
  "bird",
  "chinchilla",
  "turtle"
]
  animals.select do |x|
    x.include?("a")
  end
end

def hsh_select
favorite_things = {
  color: "red",
  animal: "pig",
  drink: "beer",
  food: "pizza"
}
  favorite_things.select do |k, v|
    v.include?("a")
  end
end

def arr_false
animals = [
  "dog",
  "cat",
  "bird",
  "chinchilla",
  "turtle"
]
 animals.take_while do |x|
    x.length < 4
  end
end

def hsh_false
favorite_things = {
  color: "red",
  animal: "pig",
  drink: "beer",
  food: "pizza"
}
  favorite_things.take_while do |k, v|
    v.length < 4
  end
end


puts animals
puts arr_reject

puts favorite_things
puts hsh_reject

puts animals
puts arr_keep_if

puts favorite_things
puts hsh_keep_if

puts animals
puts arr_select

puts favorite_things
puts hsh_select

puts animals
puts arr_false

puts favorite_things
puts hsh_false