class Item

  def price
    rand(100)
  end
end

item1 = Item.new
item2 = Item.new
puts item1.price
puts item2.price