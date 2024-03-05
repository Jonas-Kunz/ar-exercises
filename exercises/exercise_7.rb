require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
# Final Employee model
class Employee < ActiveRecord::Base
  validates :first_name, :last_name, :store_id, presence: true
  validates :hourly_rate, numericality: { greater_than_or_equal_to: 20, less_than_or_equal_to: 200}
  belongs_to :store
end

# Final Store model
class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}, allow_blank: false 
  validates :annual_revenue, numericality:{greater_than_or_equal_to: 1, only_integer: true}
  validate :has_clothes, on: :create

  def has_clothes
    if (!mens_apparel && !womens_apparel)
      errors.add(:has_clothes, "WHAT ARE YOU DOING? A CLOTHING STORE MUST HAVE CLOTHES!")
    end
  end
end



employees_to_add = [{first: "Dog", last: "Woman", rate: 60}, {first: "Johnny" , last: "Bravo", rate: 15}]
# adds an employee when given store_id
Employee.create(store_id: 1, first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
# does not add employee without store_id
Employee.create(first_name: "Bob", last_name: "boB", hourly_rate: 60)

Store_Manager.add_employees("Tattersails Emporium", employees_to_add)
# will not be added as name is less than 3
add_store("de", 100000, false, true)
# will not be added as revennue is less than 1
add_store("Desidere", 0, false, true)
# will not be added as revennue is not an integer
add_store("Desidere", "ten", false, true)
# will not be added cause no clothes!!!
add_store("Desidere", 10000, false, false)