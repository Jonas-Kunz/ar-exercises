require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"
# Your code goes here ...
def add_store (name, revenue, mens, womens)
  @store = Store.create(name: "#{name}", annual_revenue: revenue, mens_apparel: mens, womens_apparel: womens )
  if (@store.invalid?)
    puts @store.errors.full_messages
  end
end

def print_where (condition)
  @stores = Store.where(condition)
  @stores.each { |store| puts "#{store.name} has an annual revenue of #{store.annual_revenue} dollars."}
end

add_store("Craigs Coat Cottage", 400000, true, false)
add_store("Tattersails Emporium", 1000000, true, true)
add_store("Sids non-sticky Socks", 100, true, false)
add_store("Cat Coats for Dogs", 100000000, false, true)
puts Store.count
print_where({mens_apparel: true})
print_where({womens_apparel: true, annual_revenue:..999999})


