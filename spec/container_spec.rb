require "rspec"
require_relative "../app/item"
require_relative "../app/virt_item"
require_relative "../app/container"

class ItemBox

  def initialize
    @items = []
  end

  include ItemContainer
end

describe ItemContainer do

  before(:each) do
    @box = ItemBox.new
    @item1 = Item.new("kettle", price: 200)
    @item2 = Item.new("kettle", price: 300)
  end

  it "shows minimum price for the item" do
    ItemBox.min_price.should be(100)
  end

  it "adds items into container" do
   
    @box.add_item(@item1)
    @box.add_item(@item2)
    # @box.items.should have(2).items ?!
    @box.items.should include(@item1, @item2)
  end

  it "removes item from the box" do
    @box.add_item(@item1)
    @box.add_item(@item2)
    @box.remove_item.should be(@item2)
    @box.remove_item
    @box.items.should be_empty

  end

  it "raises error if user is trying to add
   anything else but an item" do
   lambda { @box.add_item("something else") }.should raise_error
  end

end