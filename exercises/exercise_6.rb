require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
def add_employees(name, employees)
  @store = @store = Store.find_by(name: name)
  employees.each { |employee| 
    added_employee = @store.employees.create(first_name: employee[:first], last_name: employee[:last], hourly_rate: employee[:rate])
    if(added_employee.invalid?)
      puts added_employee.errors.full_messages
    end
  }
  puts "#{@store.employees.count} emplyees are employed at #{@store.name}"
end

employees_to_add = [{first: "Dog Man", last: "Man Dog", rate: 60}, {first: "Bird" , last: "Cat", rate: 100}]

add_employees("Touching Cloth", employees_to_add)

