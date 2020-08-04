class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  set_type 'munchie'
  attributes :start_location, :end_location, :destination_forecast, :restaurant
end
