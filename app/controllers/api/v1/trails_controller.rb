class Api::V1::TrailsController < ApplicationController
  def index
    trails = TrailFacade.new.get_trails(params["location"])
  
    render json: TrailSerializer.new(trail_objs)
  end
end
