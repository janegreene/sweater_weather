class Munchie
  def initialize(argument, json_food)
    @id = nil
    @argument = argument
    @json_food = json_food
    # @start_location = argument[:start]
    # @end_location = argument[:end]
    # @destination_forecast = WeatherService.new.destination_weather(argument[:end])
    # @restaurant = format_restaurant(json_food)
  end
  
  def format_munchie
    { start_location: @argument[:start],
      id: 1232,
      end_location: @argument[:end],
      destination_forecast: get_weather,
      restaurant: {
        name: @json_food[:businesses][0][:name],
        address: @json_food[:businesses][0][:location][:display_address].join(", ")
      }}
  end

  def get_weather
    WeatherService.new.destination_weather(@argument[:end])
  end
end
