class Background
  attr_reader :url, :id

  def initialize(argument)
     @url = argument[:results].first[:urls][:raw]
     @id = nil
  end
end
