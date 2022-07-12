class Item

  @@discount = 0.05

  def self.discount
    if Time.now.month == 5
     return @@discount += 0.1
    else
    return @@discount
    end
  end

  def self.show_info_about(attr, block)
    @@show_info_about ||= {}
    @@show_info_about[attr] = block
  end

  def initialize(name, options = {})
    @real_price = options[:price]
    @name = name
  end

  attr_reader :real_price, :name

  def price=(value)
    @real_price = value
  end

  #attr_accessor :real_price, :weight

  def info
    #[price, weight, name]
    # price.to_s + ", " + weight.to_s + ", " + name
    yield(price)
    yield(name)
  end

  def price
    (@real_price - @real_price*self.class.discount) + tax  if @real_price
  end

  def to_s
    "#{self.name}:#{self.price}" #:#{self.weight} 
  end

  private

  def tax
    type_tax = if self.class == VirtualItem
      1
    else
      2
    end
    cost_tax = if @real_price > 5
      @real_price*0.2
      else
        @real_price*0.1
      end
        cost_tax + type_tax
  end
  
end
#puts Item.new({:price => 30}).price
#item1 = Item.new({:weight => 100, :price => 30})
#puts item1.price
#puts item1.weight

#my_data = {:name => "James", :family => "Bond"}

#puts my_data[:name]
#puts my_data[:family]

#p my_data