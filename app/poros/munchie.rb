class Munchie
  def initialize(argument, food, forecast)
    @id = nil
    @start_location = argument[:start]
    @end_location = argument[:end]
    @destination_forecast = forecast
    @restaurant = food
  end
end
