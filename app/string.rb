class String
  def to_item
    fields = self.chomp
    fields = fields.split(":") 
    puts fields[1]
    if fields.size == 3
      RealItem.new(name: fields[0], price: fields[1].to_f, weight: fields[2].to_f)
    else 
      VirtualItem.new(name: fields[0], price: fields[1].to_f)  
    end
  end
end