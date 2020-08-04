class Munchie
  def initialize(argument, json_food)
    @id = nil
    @start_location = argument[:start]
    @end_location = argument[:end]
    @destination_forecast = WeatherService.new.destination_weather(argument[:end])
    @restaurant = format_restaurant(json_food)
  end

  def format_restaurant(json_food)
    {
    name: json_food[:businesses][0][:name],
    address: json_food[:businesses][0][:location][:display_address].join(", ")
    }
  end

end
