class FlightsController < ApplicationController
  def index
    @flights = Flight.where("departure_time > ?", Time.now).order(:departure_time)
  end
end
