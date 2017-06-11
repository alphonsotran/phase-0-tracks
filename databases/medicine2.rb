require 'sqlite3'

# Create SQlite3 database
db = SQLite3::Database.new("drug_regimen2.db")
db.results_as_hash = true

table_creator_days = <<-SQL
  CREATE TABLE IF NOT EXISTS days(
    id INTEGER PRIMARY KEY,
    day VARCHAR(255),
    CONSTRAINT week UNIQUE (day)
  )
SQL
table_creator_drugs = <<-SQL
  CREATE TABLE IF NOT EXISTS drugs(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    time INT,
    day_id INT,
    FOREIGN KEY (day_id) REFERENCES days(id),
    CONSTRAINT drug_name UNIQUE (name, day_id)
  )
SQL


def add_days(db, date)
  db.execute("INSERT OR IGNORE INTO days (day) VALUES (?)", [date])
end

days_of_week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

# Create table if doesn't exist
db.execute(table_creator_days)
db.execute(table_creator_drugs)


# Populate data under drugs table
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Benadryl', '08:00', 1)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Benadryl', '08:00', 6)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Benadryl', '08:00', 7)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Melatonin', '23:00', 6)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Melatonin', '23:00', 7)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Chlorthalidone', '10:00', 1)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Chlorthalidone', '10:00', 2)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Chlorthalidone', '10:00', 3)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Chlorthalidone', '10:00', 4)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Chlorthalidone', '10:00', 5)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Chlorthalidone', '10:00', 6)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Chlorthalidone', '10:00', 7)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Multivitamins', '12:00', 1)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Multivitamins', '12:00', 2)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Multivitamins', '12:00', 3)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Multivitamins', '12:00', 4)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Multivitamins', '12:00', 5)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Multivitamins', '12:00', 6)")
db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES ('Multivitamins', '12:00', 7)")


# Populate data under days table
days_of_week.each {|d| add_days(db, d)}
test = db.execute("SELECT * FROM days")
p test.class
p test


# Driver code

puts "What would you like to do? You can type in 'search' to look at the schedule for a particular medicine, 'schedule' to look at regimen based on the day, 'add' to add a new drug."
user_destination = gets.chomp.downcase


case user_destination

when "schedule"

  # Will search the medical regimen for a particular day
  puts "What would you like to do? Type 'Today', 'Monday', 'Tuesday', etc."
  user_prompt = gets.chomp.downcase
  today = Time.now

    if user_prompt == "sunday" || (user_prompt == "today" && today.sunday?)
      sun_schedule = db.execute(
        "SELECT days.day, drugs.name, drugs.time FROM drugs
        JOIN days ON drugs.day_id = days.id
        WHERE days.id = 1"
      ).sort_by {|k| k['time']}

      puts "-----------------"
      puts "For Sunday's regimen:"
      sun_schedule.each do |k|
        puts "#{k['name']} at #{k['time']}."
      end
      puts "-----------------"

    elsif user_prompt == "monday" || (user_prompt == "today" && today.monday?)
      mon_schedule = db.execute(
        "SELECT days.day, drugs.name, drugs.time FROM drugs
        JOIN days ON drugs.day_id = days.id
        WHERE days.id = 2"
      ).sort_by {|k| k['time']}

      puts "-----------------"
      puts "For Monday's regimen:"
      mon_schedule.each do |k|
        puts "#{k['name']} at #{k['time']}."
      end
      puts "-----------------"

    elsif user_prompt == "tuesday" || (user_prompt == "today" && today.tuesday?)
      tue_schedule = db.execute(
        "SELECT days.day, drugs.name, drugs.time FROM drugs
        JOIN days ON drugs.day_id = days.id
        WHERE days.id = 3"
      ).sort_by {|k| k['time']}

      puts "-----------------"
      puts "For Tuesday's regimen:"
      tue_schedule.each do |k|
        puts "#{k['name']} at #{k['time']}."
      end
      puts "-----------------"

    elsif user_prompt == "wednesday" || (user_prompt == "today" && today. wednesday?)
      wed_schedule = db.execute(
        "SELECT days.day, drugs.name, drugs.time FROM drugs
        JOIN days ON drugs.day_id = days.id
        WHERE days.id = 4"
      ).sort_by {|k| k['time']}

      puts "-----------------"
      puts "For Wednesday's regimen:"
      wed_schedule.each do |k|
        puts "#{k['name']} at #{k['time']}."
      end
      puts "-----------------"

    elsif user_prompt == "thursday" || (user_prompt == "today" && today.  thursday?)
      thu_schedule = db.execute(
        "SELECT days.day, drugs.name, drugs.time FROM drugs
        JOIN days ON drugs.day_id = days.id
        WHERE days.id = 5"
      ).sort_by {|k| k['time']}

      puts "-----------------"
      puts "For Thursday's regimen:"
      thu_schedule.each do |k|
        puts "#{k['name']} at #{k['time']}."
      end
      puts "-----------------"

    elsif user_prompt == "friday" || (user_prompt == "today" && today.friday?)
      fri_schedule = db.execute(
        "SELECT days.day, drugs.name, drugs.time FROM drugs
        JOIN days ON drugs.day_id = days.id
        WHERE days.id = 6"
      ).sort_by {|k| k['time']}

      puts "-----------------"
      puts "For Friday's regimen:"
      fri_schedule.each do |k|
        puts "#{k['name']} at #{k['time']}."
      end
      puts "-----------------"

    elsif user_prompt == "saturday" || (user_prompt == "today" && today.  saturday?)
      sat_schedule = db.execute(
        "SELECT days.day, drugs.name, drugs.time FROM drugs
        JOIN days ON drugs.day_id = days.id
        WHERE days.id = 7"
      ).sort_by {|k| k['time']}

      puts "-----------------"
      puts "For Saturday's regimen:"
      sat_schedule.each do |k|
        puts "#{k['name']} at #{k['time']}."
      end
      puts "-----------------"

    else
      puts "Invalid input."
    end

when "search"

  all_drugs = db.execute(
    "SELECT days.day, drugs.name, drugs.time FROM drugs
        JOIN days ON drugs.day_id = days.id"
    )
  drug_name = db.execute("SELECT DISTINCT name FROM drugs")

  # Lists available medicine in the current regimen
  puts "-----------------"
  puts "List of medicine:"
  drug_name.each do |x|
    puts "#{x['name']}"
  end
  puts "-----------------"

  # Will search the days to take the particular medicine
  puts "Type in the medicine you would like to search."
  med = gets.chomp.downcase

  # Print the schedule for the searched medicine
  all_drugs.each do |x|
    if x['name'].downcase == med
      puts "Take on #{x['day']} at #{x['time']}"
    end
  end

when "add"

  puts "Type name of medicine:"
  pill_name = gets.chomp.capitalize

  puts "Type time of dosage: (use military hours 00:00-22:00)"
  dosage_time = gets.chomp

  puts "What day will you take the medicine?"
  what_day = gets.chomp.capitalize

  assign_day = db.execute("SELECT * FROM days")
  the_day = []

  assign_day.each do |x|
    the_day << x['id'] if what_day == x['day']
  end

  def insert_drug(db, name, time, id)
    db.execute("INSERT OR IGNORE INTO drugs (name, time, day_id) VALUES (?, ?,  ?)", [name, time, id])
  end

  insert_drug(db, pill_name, dosage_time, the_day)
  puts "Successfully added #{pill_name}."
  puts "Time of day: #{the_day} at #{dosage_time}"

end