require 'sqlite3'

db =SQLite3::Database.new("drug_regiment.db")
db.results_as_hash = true