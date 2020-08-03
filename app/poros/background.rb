class Background
 attr_reader :url, :id
 def initialize(argument)
   @url = argument[:results][0][:urls][:raw]
   @id = nil
 end
end
