class VirtualItem < Item
  def to_s
    "#{self.name}:#{self.price}" #:#{self.weight} 
  end
end