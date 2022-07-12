class Order

  attr_reader :items, :placed_at

  include ItemContainer
  
  def initialize
    @items = [] 
  end 

  def place
    @placed_at = Time.now
    #mock
  end
  
end