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

