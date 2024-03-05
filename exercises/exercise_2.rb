require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

# Your code goes here ...

def eddit_store_column (name, column, data)
  @store = Store.find_by(name: name)
  if (@store.invalid?)
    puts @store.errors.full_messages
  end
  begin 
    puts @store.mens_apparel
    @store.send("#{column}=", data)
    @store.save!
    puts "Store Was successfully updated."
  rescue ActiveRecord::RecordInvalid => e
    puts "Store update failed: #{e}"
  else
    puts "No exceptions were raised during Saving"
  ensure
    puts "Save complete"
  end
  puts @store.send(column)

end

eddit_store_column("Touching Cloth", :mens_apparel, false)
