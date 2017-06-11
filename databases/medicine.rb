require 'sqlite3'
require 'date'

db = SQLite3::Database.new("drug_regimen.db")
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
    CONSTRAINT drug_name UNIQUE (name)
  )
SQL
table_creator_regimen = <<-SQL
  CREATE TABLE IF NOT EXISTS regimen(
  id INTEGER PRIMARY KEY,
  days_id INT,
  drugs_id INT,
  FOREIGN KEY (days_id) REFERENCES days(id),
  FOREIGN KEY (drugs_id) REFERENCES drugs(id),
  CONSTRAINT match_id UNIQUE (days_id, drugs_id)
  )
SQL

def add_days(db, date)
  db.execute("INSERT OR IGNORE INTO days (day) VALUES (?)", [date])
end

days_of_week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

# Create table if doesn't exist
db.execute(table_creator_days)
db.execute(table_creator_drugs)
db.execute(table_creator_regimen)

# Populate data under drugs table
db.execute("INSERT OR IGNORE INTO drugs (name, time) VALUES ('Benadryl', '08:00')")
db.execute("INSERT OR IGNORE INTO drugs (name, time) VALUES ('Melatonin', '23:00')")
db.execute("INSERT OR IGNORE INTO drugs (name, time) VALUES ('Chlorthalidone', '10:00')")
db.execute("INSERT OR IGNORE INTO drugs (name, time) VALUES ('Multivitamins', '12:00')")

# Populate data under days table
days_of_week.each {|d| add_days(db, d)}

# Populate data under regimen table
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (1, 3)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (2, 3)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (3, 3)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (4, 3)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (5, 3)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (6, 3)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (7, 3)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (6, 2)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (7, 2)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (1, 1)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (6, 1)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (7, 1)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (1, 4)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (2, 4)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (3, 4)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (4, 4)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (5, 4)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (6, 4)")
db.execute("INSERT OR IGNORE INTO regimen (days_id, drugs_id) VALUES (7, 4)")



# Driver code

puts "What would you like to do? You can type in 'search' to look at the schedule for a particular medicine or 'schedule' to look at regimen based on the day."
user_destination = gets.chomp.downcase


case user_destination

when "schedule"

  puts "What would you like to do? Type 'Today', 'Monday', 'Tuesday', etc."
  user_prompt = gets.chomp.downcase
  today = Time.now

    if user_prompt == "sunday" || (user_prompt == "today" && today.sunday?)
      sun_schedule = db.execute(
        "SELECT days.day, drugs.name, drugs.time FROM days
        JOIN regimen ON days.id = regimen.days_id
        JOIN drugs ON regimen.drugs_id = drugs.id
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
        "SELECT days.day, drugs.name, drugs.time FROM days
        JOIN regimen ON days.id = regimen.days_id
        JOIN drugs ON regimen.drugs_id = drugs.id
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
        "SELECT days.day, drugs.name, drugs.time FROM days
        JOIN regimen ON days.id = regimen.days_id
        JOIN drugs ON regimen.drugs_id = drugs.id
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
        "SELECT days.day, drugs.name, drugs.time FROM days
        JOIN regimen ON days.id = regimen.days_id
        JOIN drugs ON regimen.drugs_id = drugs.id
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
        "SELECT days.day, drugs.name, drugs.time FROM days
        JOIN regimen ON days.id = regimen.days_id
        JOIN drugs ON regimen.drugs_id = drugs.id
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
        "SELECT days.day, drugs.name, drugs.time FROM days
        JOIN regimen ON days.id = regimen.days_id
        JOIN drugs ON regimen.drugs_id = drugs.id
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
        "SELECT days.day, drugs.name, drugs.time FROM days
        JOIN regimen ON days.id = regimen.days_id
        JOIN drugs ON regimen.drugs_id = drugs.id
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
        "SELECT days.day, drugs.name, drugs.time FROM days
        JOIN regimen ON days.id = regimen.days_id
        JOIN drugs ON regimen.drugs_id = drugs.id"
        )
  drug_name = db.execute("SELECT * FROM drugs")

  puts "-----------------"
  puts "List of medicine:"
  drug_name.each do |x|
    puts "#{x['name']}"
  end
  puts "-----------------"

  puts "Type in the medicine you would like to search."
  med = gets.chomp.downcase

  all_drugs.each do |x|
    if x['name'].downcase == med
      puts "Take on #{x['day']} at #{x['time']}"
    end
  end
end

#puts "Would you like to create or delete a regimen?"
#user_creation = gets.chomp.downcase

#puts "Type name of medicine:"
#pill_name = gets.chomp.downcase
#
#puts "Type time of dosage: (use military hours e.g. 22:00)"
#dosage_time = gets.chomp
#
#puts "What day will you take the medicine?"
#what_day = gets.chomp.downcase
#
#db.execute("INSERT INTO drugs (name, time) VALUE (#{pill_name}, #{dosage_time}#)")
#db.execute("INSERT INTO regimen (days_id, drugs_id) VALUES (7, NULL)")
