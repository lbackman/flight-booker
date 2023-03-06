class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking.passengers.build
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save

      @booking.passengers.each do |passenger|
        PassengerMailer.with(booking: @booking).confirmation_email(passenger).deliver_later
      end

      redirect_to booking_path(@booking.id), notice: "Flight successfully booked!"
    else
      @flight = Flight.find(booking_params[:flight_id])
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:_destroy, :id, :name, :email])
    end
end
