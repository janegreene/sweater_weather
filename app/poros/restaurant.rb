class Restaurant
  attr_reader :name, :address
  def initialize(json)
    @name = json[:businesses][0][:name]
    @address = json[:businesses][0][:location][:display_address].join(", ")
  end
end
