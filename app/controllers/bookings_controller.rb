class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.passengers.build
  end

  def create
  end

  def show
  end
end
