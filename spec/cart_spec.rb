require "rspec"
require_relative "../app/item"
require_relative "../app/virt_item"
require_relative "../app/antique_item"
require_relative "../app/container"
require_relative "../app/cart"

describe Cart do

  # it "makes sure the cart is initialized correctly" do
  #   cart = Cart.new(...)
  #   cart.items.should be_kind_of(Array)
  #   cart.owner.should_not be_nil
  
  # end

  describe "managing items" do
    it "adds items into the cart" do
      cart =Cart.new("alex")
      item1 = Item.new("kettle", price: 200)
      item2 = Item.new("car", price: 200)
      cart.add_items(item1, item2)
      cart.items.should include(item1, item2)
    end
  end

  it "removes items from itself" 
  it "counts items in itself"
  it "place order using all the items that were added into cart"
  it " clears itself off the items after on order is placed"

end