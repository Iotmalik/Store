class Item

  def initialize
    @price = 30
  end

  def price
    @price
  end
  
   def price=(price_value)
    @price = price_value
  end
  
end

item1 = Item.new
puts item1.price
item1.price = 10

puts item1.price
item1.price=(100)
puts item1.price
