class Student
 attr_accessor :name, :grade
 attr_reader :# IDEA:

def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
end

def self.create_table
   sql = <<-SQL
   CREATE TABLE IF NOT EXISTS students (
     id INTEGER PRIMARY KEY,
     name TEXT,
     grage INTEGER
   )
   SQL

   DB[:conn].execute(sql)

end

def self.drop_table
  sql = <<-SQL
  DROP TABLE students
  SQL

  DB[:conn].execute(sql)

end

def save
 sql = <<-SQL
 INSERT INTO students(name, grade)
 VALUES (?,?)
 SQL

 DB[:conn].execute(sql, self.name, self.grade)
 @id = DB[:conn].execute("SELECT id FROM students ORDER BY id DESC LIMIT 1")[0][0]
end

def self.create(s)
  student = Student.new(s[:name], s[:grade])
  student.save
  student
end
end 
