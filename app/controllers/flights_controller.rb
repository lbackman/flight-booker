class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params[:departure_id], params[:arrival_id], params[:departure_time])
    @airports = Airport.all
    @dates = Flight.get_flight_dates
  end
end
