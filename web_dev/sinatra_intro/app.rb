# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
#get '/' do
#  "#{params[:name]} is #{params[:age]} years old."
#end


# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end


get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end


# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# Release 0
get '/' do
  name = params[:name]
  if name
    "Good job, #{name}!"
  else
    "Good job!"
  end
end

get '/contact' do
  "2250 Benvenue Ave.
  Berkeley, CA, 94609"
end


get '/:number_1/add/:number_2' do
  number1 = params[:number_1].to_i
  number2 = params[:number_2].to_i
  total = number1 + number2
  "#{number1} + #{number2} = #{total}"
end

get '/students/:like' do
  like = params[:like]
  the_name = db.execute("SELECT * FROM students WHERE name LIKE '% ? %'", like)
  the_name.to_s
end

# Release 1
=begin
Is Sinatra the only web app library in Ruby? What are some others?
No. There are other web app libraries and these exists as Ruby on Rails, Volt, Padrino, Cuba, and many others.

Are SQLite and the sqlite3 gem your only options for using a database with Sinatra? What are some others?
No, there are other databases. These include ActiveRecord, rake, and many others.

What is meant by the term web stack?
A web stack is a collection that contains an operating system, language, database, and web server. These are required for Web development.
=end