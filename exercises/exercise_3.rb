require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'

puts "Exercise 3"
puts "----------"

# Your code goes here ...
def delete_store_by_name (name)
  @store = Store.find_by(name: name)

  begin
    @store.destroy
  rescue ActiveRecord::RecordInvalid => e
    puts "Store update failed: #{e}"
  else
    puts "Store deleted successfully"
  end
end

delete_store_by_name("Tatter Sails Emporioum")
puts Store.count

  