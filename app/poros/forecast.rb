class Forecast
  attr_reader :id, :timezone, :time, :current, :daily, :hourly, :location
  #before action to initialize other poros

def initialize(forecast_json)
  @location =
  @timezone = forecast_json[:timezone]
  @time = convert_day_and_time(forecast_json[:current][:dt])
  @current = format_current(forecast_json[:current])
  @daily = format_daily(forecast_json[:daily])
  @hourly = format_hourly(forecast_json[:hourly])
  @id = nil
end

private
  def convert_hourly_time(unix_time)
    Time.at(unix_time).strftime('%l:%M %p')
  end

  def convert_day_and_time(unix_time)
    Time.at(unix_time).strftime('%l:%M %p, %B %e')
  end

  def convert_day(unix_time)
    Time.at(unix_time).strftime('%A')
  end

  def format_current(current_json)
      current_forecast = {
        day_time: convert_day_and_time(current_json[:dt]),
        sunrise: convert_hourly_time(current_json[:sunrise]),
        sunset: convert_hourly_time(current_json[:sunset]),
        temp: current_json[:temp],
        feels_like: current_json[:feels_like],
        humidity: current_json[:humidity],
        uvi: current_json[:uvi],
        visibility: current_json[:visibility],
        weather: current_json[:weather]
      }
  end

  def format_daily(daily_json)
    days = daily_json.map do |forecast|
      test = {
        day: convert_day(forecast[:dt]),
        max_temp: forecast[:temp][:max],
        min_temp: forecast[:temp][:min],
        icon: forecast[:weather][0][:icon],
        description: forecast[:weather][0][:main],
        precipitation: forecast[:rain] || 0
      }
    end
  end

  def format_hourly(hourly_json)
    hourly_json.map do |forecast|
      {
      time: convert_hourly_time(forecast[:dt]),
      temp: forecast[:temp],
      icon: forecast[:weather][0][:icon]
      }
    end
  end
end
