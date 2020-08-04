class Restaurant
  attr_reader :name, :address
  def initialize(json)
    require "pry"; binding.pry
    @name = json
    @address = json
  end
end
