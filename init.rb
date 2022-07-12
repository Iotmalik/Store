require_relative "app/store_application"

StoreApplication.config do |app|

  app.name       = "My Store"
  app.enviroment = :prodaction

  app.admin do |admin|
    admin.email = "admin@mystore.com"
    admin.login = "admin"
    admin.send_info_emails_on :mondays
  end

end

unless StoreApplication.frozen?
  StoreApplication.name = "My name"
end
#StoreApplication::Admin.email = "asdfgh"
p StoreApplication::Admin.email
@items =[]
@items << AntiqueItem.new("car", price: 101)
@items << RealItem.new(:weight => 100, :price => 150, :name => "kettle")
@items << RealItem.new(:weight => 100, :price => 120, :name => "dishwasher")

#@items.each { |i| puts i.name }

cart = Cart.new("alex")
cart.add_item RealItem.new(:weight => 100, :price => 150, :name => "car")
cart.add_item RealItem.new(:weight => 100, :price => 120, :name => "car")
cart.add_item RealItem.new(:weight => 100, :price => 130, :name => "kettle")

order = Order.new
order.place
puts order.placed_at.strftime("%b %-d, %Y %H:%M:%S")

#ethod = "all_cars"
#p cart.send(method)

#puts @items[0].send(:tax)
#puts @items[0].tax
#puts @items[0].respond_to?(:info)

#puts @items[0].kind_of?(AntiqueItem)
#puts @items[0].kind_of?(Item)
#puts @items[0].class == AntiqueItem
#puts @items[0].class == Item

#cart = Cart.new
#cart.add_item item1
#cart.add_item item2
#cart.add_item item3
#puts cart.items.size


#puts item1.price
#puts item1.real_price

#cart.delete_invalid_items

#p item1.respond_to?(:weight)
#p item2.respond_to?(:weight)

#cart.add_item(Item.new)
#cart.add_item(Item.new)
#cart.validate
#p cart.items

#cart.remove_item
#p cart.items