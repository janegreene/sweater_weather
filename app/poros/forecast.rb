class Forecast
  attr_reader :id, :timezone, :time, :current, :daily, :hourly
def initialize(forecast_json)
  @timezone = forecast_json[:timezone]
  @time = convert_time(forecast_json[:current][:dt])
  @current = format_current(forecast_json[:current])
  @daily = format_daily(forecast_json[:daily])
  @hourly = format_hourly(forecast_json[:hourly])
  @id = nil
end

private
  def convert_time(unix_time)
    test = Time.at(unix_time).strftime('%I:%M %p')#.in_time_zone(@timezone)
    require "pry"; binding.pry
  end

  def format_current(current_json)
    current_json.without(:dew_point, :wind_speed, :pressure, :wind_deg, :clouds)
  end

  def format_daily(daily_json)
    daily_json.map do |forecast|
      {
        day: forecast[:dt],
        max_temp: forecast[:temp][:max],
        min_temp: forecast[:temp][:min],
        icon: forecast[:weather][0][:icon],
        description: forecast[:weather][0][:description],
        precipitation: forecast[:rain]
      }
    end
  end

  def format_hourly(hourly_json)
    hourly_json.map do |forecast|
      {
      time: forecast[:dt],
      temp: forecast[:temp],
      icon: forecast[:weather][0][:icon]
      }
    end
  end
end
