class Trail
   @@trails = Array.new
  def initialize(trail_info)
    @name = trail_info[:name]
    @difficulty = trail_info[:difficulty]
    @summary = trail_info[:summary]
    @latitude = trail_info[:latitude]
    @longitude = trail_info[:longitude]
    @location = trail_info[:location]
    @@trails << self
  end
  def self.format_trails(json)
    json[:trails].each do |trail|
      Trail.new(trail)
    end
  end

  def self.all_instances
    @@trails
  end
end
