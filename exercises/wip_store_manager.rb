require_relative '../setup'

# Silly Store Manager for fun and exploration
class Store_Manager

  def add_store (name, revenue, mens, womens)
    @store = Store.create(name: "#{name}", annual_revenue: revenue, mens_apparel: mens, womens_apparel: womens )
    if (@store.invalid?)
      puts @store.errors.full_messages
    end
  end

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

  def print_where (condition)
    @stores = Store.where(condition)
    @stores.each { |store| puts "#{store.name} has an annual revenue of #{store.annual_revenue} dollars."}
  end

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
  # I really want to add an interface for fun, will do when time comes.
  # def interface
  #   puts "Welcome to the Silly Store Manager. Which employees do you wish to Ter-- sorry give raises to?"
  #   puts "To Add Employees to a store press E, To Magically create a Store press C, To alter stores press E"

  # end
end