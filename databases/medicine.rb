require 'sqlite3'
require 'date'

db = SQLite3::Database.new("drug_regiment.db")
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
table_creator_regiment = <<-SQL
  CREATE TABLE IF NOT EXISTS regiment(
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
db.execute(table_creator_regiment)
regiment_array = db.execute("SELECT * FROM regiment")

# Populate data under drugs table
db.execute("INSERT OR IGNORE INTO drugs (name, time) VALUES ('Benadryl', '8:00')")
db.execute("INSERT OR IGNORE INTO drugs (name, time) VALUES ('Melatonin', '23:00')")
db.execute("INSERT OR IGNORE INTO drugs (name, time) VALUES ('Chlorthalidone', '10:00')")
db.execute("INSERT OR IGNORE INTO drugs (name, time) VALUES ('Multivitamins', '12:00')")

# Populate data under days table
days_of_week.each {|d| add_days(db, d)}

# Populate data under regiment table
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (1, 3)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (2, 3)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (3, 3)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (4, 3)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (5, 3)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (6, 3)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (7, 3)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (6, 2)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (7, 2)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (1, 1)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (6, 1)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (7, 1)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (1, 4)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (2, 4)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (3, 4)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (4, 4)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (5, 4)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (6, 4)")
db.execute("INSERT OR IGNORE INTO regiment (days_id, drugs_id) VALUES (7, 4)")






#p regiment_array

# Driver code

puts "What would you like to do? Type 'today' for today's regiment.
today = gets.chomp



