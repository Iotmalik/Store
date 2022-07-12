class Cart

  attr_reader :items

  include ItemContainer
  class ItenNotSupported < StandardError; end

  UNSUPPORTED_ITEMS = [AntiqueItem, VirtualItem]
  
  def initialize(owner)
    @items = Array.new
    @owner = owner
  end 

  def add_items(*items)
    @items += items
  end

  def save_to_file
    File.open("#{@owner}_cart.txt", "w") do |f|
      @items.each do |i|
        raise ItenNotSupported if UNSUPPORTED_ITEMS.include?(i.class)
        f.puts i
      end
    end
  end

  def read_from_file
    #return unless File.exists?("#{@owner}_cart.txt")
    File.readlines("#{@owner}_cart.txt").each { |i| @items << i.to_item }
    @items.uniq!
  rescue Errno::ENOENT
    File.open("#{@owner}_cart.txt", "w") {}
    puts "file #{@owner}_cart.txt created"
  end

end
    