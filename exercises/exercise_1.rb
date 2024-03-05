require_relative '../setup'

puts "Exercise 1"
puts "----------"

# Your code goes below here ...

class Store < ActiveRecord::Base
  
end
touching_cloth = Store.create(name: "Touching Cloth", annual_revenue: 300000, mens_apparel: true, womens_apparel: true )
tatterSails = Store.create(name: "Tatter Sails Emporioum", annual_revenue: 1000000, mens_apparel: true, womens_apparel: true)
puts Store.count