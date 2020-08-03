class Trail
   @@trails = Array.new
   attr_reader :name, :difficulty, :summary, :location, :distance_to_trail, :id
  def initialize(trail_info, distance)
    @name = trail_info[:name]
    @difficulty = trail_info[:difficulty]
    @summary = trail_info[:summary]
    @location = trail_info[:location]
    @distance_to_trail = distance[0]
    @@trails << self
    @id = nil
  end
  def self.format_trails(json)
    json[:trails].each do |trail|
      # require "pry"; binding.pry
      location = trail[:location]
      find_distance = MapquestService.new.get_distance(location)
      distance = find_distance.map do |distance|
        distance[1][:distance]
      end
      Trail.new(trail, distance)
    end
  end

  def self.all_instances
    @@trails
  end
end
