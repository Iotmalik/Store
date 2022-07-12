require "rspec"
require_relative "../app/item"
require_relative "../app/virt_item"

describe Item do
  
  before(:each) do
    @item = Item.new("kettle", price: 200)
  end

  before(:all) do
  end

  after(:each) do
  end

  after(:all) do 
  end

  it "calculates price according to a speciaal formula" do
    @item.price.should == 232
    @item.price = 300
  end

  it "returns info about an object" do
    @item.to_s.should == "kettle:232.0"
  end

  it "calculates tax" do
    @item.send(:tax).should_not be_nil
  end
end