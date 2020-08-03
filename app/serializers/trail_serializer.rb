class TrailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :difficulty, :summary, :location, :distance_to_trail, :id
end
