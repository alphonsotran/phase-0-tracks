require 'sqlite3'
require 'date'

db = SQLite3::Database.new("drug_regiment.db")
db.results_as_hash = true

table_creator_days = <<-SQL
  CREATE TABLE IF NOT EXISTS days(
    id INTEGER PRIMARY KEY,
    day VARCHAR(255)
  )
SQL
table_creator_drugs = <<-SQL
  CREATE TABLE IF NOT EXISTS drugs(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    time_per_day INT,
    time INT
  )
SQL
table_creator_regiment = <<-SQL
  CREATE TABLE IF NOT EXISTS regiment(
  id INTEGER PRIMARY KEY,
  days_id INT,
  drugs_id INT,
  FOREIGN KEY (days_id) REFERENCES days(id),
  FOREIGN KEY (drugs_id) REFERENCES drugs(id)
  )
SQL

db.execute(table_creator_days)
db.execute(table_creator_drugs)
db.execute(table_creator_regiment)
regiment_array = db.execute("SELECT * FROM regiment")

days_of_week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

def add_days(db, date)
  db.execute("INSERT OR IGNORE INTO days (day) VALUES (?)", [date])
end

db.execute("INSERT OR IGNORE INTO drugs (name, time_per_day, time) VALUES ('Fiber Pills', 2, '22:00')")

days_of_week.each {|d| add_days(db, d)}
p regiment_array