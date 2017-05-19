# Array Drills

zombie_apocalypse_supplies = ["hatchet", "rations", "water jug", "binoculars",
                              "shotgun", "compass", "CB radio", "batteries"]

# 1. Iterate through the zombie_apocalypse_supplies array,
# printing each item in the array separated by an asterisk
# ----

def zombie_asterik(arr)
zombie_arr = []
  arr.each do |x|
    zombie_arr << "#{x}"
  end
  zombie_arr.join("*")
end

p zombie_asterik(zombie_apocalypse_supplies)

# 2. In order to keep yourself organized, sort your zombie_apocalypse_supplies
# in alphabetical order. Do not use any special built-in methods.
# ----

def zombie_alphabetical(arr)
x = arr.length
  loop do
    switch = false
    (x-1).times do |n|
      if arr[n] > arr[n+1]
        arr[n], arr[n+1] = arr[n+1], arr[n]
        switch = true
      endls

    end
    break if switch == false
  end
 arr
end

p zombie_alphabetical(zombie_apocalypse_supplies)

# 3. Create a method to see if a particular item (string) is in the
# zombie_apocalypse_supplies. Do not use any special built-in methods.
# For instance: are boots in your list of supplies?
# ----

def search_supplies(arr, str)
  arr.each_index do |idx|
    if arr[idx] == str
      return "Yes, #{str} is in the zombie apocalypse supplies."
    elsif arr[idx+1] == nil
      return "No, these #{str} are not part of the zombie supplies list."
    else
      next
    end
  end
end

p search_supplies(zombie_apocalypse_supplies, "boot")

# 4. You can't carry too many things, you've only got room in your pack for 5.
# Remove items in your zombie_apocalypse_supplies in any way you'd like,
# leaving only 5. Do not use any special built-in methods.
# ----

def only_five(arr)
  five_items = []
  n = (0..4).to_a
  n.each do |x|
    five_items << arr[x]
  end
  five_items
end

p only_five(zombie_apocalypse_supplies)

# 5. You found another survivor! This means you can combine your supplies.
# Create a new combined supplies list out of your zombie_apocalypse_supplies
# and their supplies below. You should get rid of any duplicate items.
# Find the built-in method that helps you accomplish this in the Ruby
# documentation for Arrays.
other_survivor_supplies = [ "warm clothes", "rations", "compass", "camp stove",
                            "solar battery", "flashlight"]
# ----

def combine_supplies(arr1, arr2)
  combined_items = arr1.concat(arr2)
  combined_items_s = zombie_alphabetical(combined_items)
  combined_items_s.uniq
end

p combine_supplies(zombie_apocalypse_supplies, other_survivor_supplies)
# Hash Drills

extinct_animals = {
  "Tasmanian Tiger" => 1936,
  "Eastern Hare Wallaby" => 1890,
  "Dodo" => 1662,
  "Pyrenean Ibex" => 2000,
  "Passenger Pigeon" => 1914,
  "West African Black Rhinoceros" => 2011,
  "Laysan Crake" => 1923
}

# 1. Iterate through extinct_animals hash, printing each key/value pair
# with a dash in between the key and value, and an asterisk between each pair.
# ----

def print_hsh(hsh1)
  hsh_ast = []
  hsh1.each do |k,v|
    hsh_ast << "#{k}-#{v}"
  end
  hsh_ast.join("*")
end

p print_hsh(extinct_animals)

# 2. Keep only animals in extinct_animals if they were extinct before
# the year 2000. Do not use any special built-in methods.
# ----

def extinct_2000(hsh1)
  hsh_2000 = {}
  hsh1.each do |k, v|
    if v < 2000
      hsh_2000[k] = v
    end
  end
  hsh_2000
end

p extinct_2000(extinct_animals)

# 3. Our calculations were completely off, turns out all of those animals went
# extinct 3 years before the date provided. Update the values in extinct_animals
# so they accurately reflect what year the animal went extinct.
# Do not use any special built-in methods.
# ----

def extinct_correction(hsh1)
  updated_hsh = {}
  hsh1.each do |k, v|
    updated_hsh[k] = v-3
  end
  updated_hsh
end

p extinct_correction(extinct_animals)

# 4. You've heard that the following animals might be extinct, but you're not sure.
# Check if they're included in extinct_animals, one by one:
# "Andean Cat"
# "Dodo"
# "Saiga Antelope"
# Do not use any special built-in methods.
# ----

def check_extinct(hsh1, str)
  leftovers = []
  hsh1.each_key do |k|
    if k == str
      return "Yes, the #{str} is extinct."
    end
  end
  return "No, the #{str} is not extinct."
end

puts check_extinct(extinct_animals, "Andean Cat")
puts check_extinct(extinct_animals, "Dodo")
puts check_extinct(extinct_animals, "Saiga Antelope")


# 5. We just found out that the Passenger Pigeon is actually not extinct!
# Remove them from extinct_animals and return the key value pair as a two item array.
# Find the built-in method that helps you accomplish this in the Ruby documentation
# for Hashes.
# ----

def remove_animal(hsh1, str)
  remove_hsh = {}
  hsh1.each do |k, v|
    if k == str
      remove_hsh[k] = v
    end
  end
  remove_hsh.flatten
end

p remove_animal(extinct_animals, "Passenger Pigeon")