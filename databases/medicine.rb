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

db.execute(table_creator_days)
db.execute(table_creator_drugs)
db.execute(table_creator_regimen)
regimen_array = db.execute("SELECT * FROM regimen")
regimen_sat = db.execute(
          "SELECT days.day, drugs.name, drugs.time FROM days
          JOIN regimen ON days.id = regimen.days_id
          JOIN drugs ON regimen.drugs_id = drugs.id
          WHERE days.id = 7"
        )

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






#p regimen_array
#p regimen_sat

# Driver code

puts "What would you like to do? Type 'Monday', 'Tuesday', etc."
user_prompt = gets.chomp.downcase
today = Time.now

  if user_prompt == "sunday"
    sun_schedule = db.execute(
      "SELECT days.day, drugs.name, drugs.time FROM days
      JOIN regimen ON days.id = regimen.days_id
      JOIN drugs ON regimen.drugs_id = drugs.id
      WHERE days.id = 1"
    ).sort_by {|k| k['time']}

    puts "For Sunday's regimen:"
    sun_schedule.each do |k|
      puts "#{k['name']} at #{k['time']}."
    end
  elsif user_prompt == "monday"
    mon_schedule = db.execute(
      "SELECT days.day, drugs.name, drugs.time FROM days
      JOIN regimen ON days.id = regimen.days_id
      JOIN drugs ON regimen.drugs_id = drugs.id
      WHERE days.id = 2"
    ).sort_by {|k| k['time']}

    puts "For Monday's regimen:"
    mon_schedule.each do |k|
      puts "#{k['name']} at #{k['time']}."
    end
  elsif user_prompt == "tuesday"
    tue_schedule = db.execute(
      "SELECT days.day, drugs.name, drugs.time FROM days
      JOIN regimen ON days.id = regimen.days_id
      JOIN drugs ON regimen.drugs_id = drugs.id
      WHERE days.id = 3"
    ).sort_by {|k| k['time']}

    puts "For Tuesday's regimen:"
    tue_schedule.each do |k|
      puts "#{k['name']} at #{k['time']}."
    end
  elsif user_prompt == "wednesday"
    wed_schedule = db.execute(
      "SELECT days.day, drugs.name, drugs.time FROM days
      JOIN regimen ON days.id = regimen.days_id
      JOIN drugs ON regimen.drugs_id = drugs.id
      WHERE days.id = 4"
    ).sort_by {|k| k['time']}

    puts "For Wednesday's regimen:"
    wed_schedule.each do |k|
      puts "#{k['name']} at #{k['time']}."
    end
  elsif user_prompt == "thursday"
    thu_schedule = db.execute(
      "SELECT days.day, drugs.name, drugs.time FROM days
      JOIN regimen ON days.id = regimen.days_id
      JOIN drugs ON regimen.drugs_id = drugs.id
      WHERE days.id = 5"
    ).sort_by {|k| k['time']}

    puts "For Thursday's regimen:"
    thu_schedule.each do |k|
      puts "#{k['name']} at #{k['time']}."
    end
  elsif user_prompt == "friday"
    fri_schedule = db.execute(
      "SELECT days.day, drugs.name, drugs.time FROM days
      JOIN regimen ON days.id = regimen.days_id
      JOIN drugs ON regimen.drugs_id = drugs.id
      WHERE days.id = 6"
    ).sort_by {|k| k['time']}

    puts "For Friday's regimen:"
    fri_schedule.each do |k|
      puts "#{k['name']} at #{k['time']}."
    end
  elsif user_prompt == "saturday"
    sat_schedule = db.execute(
      "SELECT days.day, drugs.name, drugs.time FROM days
      JOIN regimen ON days.id = regimen.days_id
      JOIN drugs ON regimen.drugs_id = drugs.id
      WHERE days.id = 7"
    ).sort_by {|k| k['time']}

    puts "For Saturday's regimen:"
    sat_schedule.each do |k|
      puts "#{k['name']} at #{k['time']}."
    end
  else
    puts "Invalid input."
  end

#puts "Would you like to create or delete a regimen?"
#user_creation = gets.chomp.downcase

puts "Type name of medicine:"
pill_name = gets.chomp.downcase

puts "Type time of dosage: (use military hours e.g. 22:00)"
dosage_time = gets.chomp

puts "What day will you take the medicine?"
what_day = gets.chomp.downcase

db.execute("INSERT INTO drugs (name, time) VALUE (#{pill_name}, #{dosage_time})")
db.execute("INSERT INTO regimen (days_id, drugs_id) VALUES (7, NULL)")
