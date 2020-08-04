class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  set_type 'munchie'
  attributes :id, :start_location, :end_location, :destination_forecast, :restaurant
end
