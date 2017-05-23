# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # Create a hash with items and associated quantities.
  # set default quantity
  # print the list to the console using print method
# output: hash



def create_a_list(items)
  item_array = items.split
  shopping_list = {}
  item_array.each do |x|
    shopping_list[x] = 1
  end
  #shopping_list.store(items)
  shopping_list
end

my_list = create_a_list("carrots apples cereal pizza")
#p my_list

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: Add an item in the list with the quantity.
# output: print each item out with the associated quantity. (hash)

def add_item(list, key, quantity)
  list["#{key}"] = quantity
  list
end

add_item(my_list, "bananas", 2)
#p my_list

# Method to remove an item from the list
# input: list, item
# steps: Remove key from hash (list).
# output: New hash without the item.

def deleted_item(list, key)
  list.delete_if {|k, v| k == "#{key}"}
  list
end

puts deleted_item(my_list, "carrots")
#p my_list

# Method to update the quantity of an item
# input: list, item, quantity
# steps: Update the value and the associated key.
# output: New hash with updated quantity.

def update_quantity(list, key, quantity)
  list["#{key}"] = quantity
  list
end

puts update_quantity(my_list, "pizza", 5)


# Method to print a list and make it look pretty
# input: list
# steps: print "Your shopping list: key -- value".
# output: Interpolated pretty hash.

def print_list(list)
  puts "Your shopping list:"
  list.each do |k, v|
    puts "#{k} -- #{v}"
  end
end

print_list(my_list)