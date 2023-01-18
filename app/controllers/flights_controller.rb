class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params[:departure_airport_id], params[:arrival_airport_id], params[:departure_time]).upcoming
    @airports = Airport.all
    @dates = Flight.get_flight_dates
  end
end
