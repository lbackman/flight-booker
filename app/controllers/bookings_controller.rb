class BookingsController < ApplicationController
  def new
    @passenger_amount = passenger_amount
    @booking = Booking.new
    @passenger_amount.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to booking_path(@booking.id), notice: "Flight successfully booked!"
    else
      @flight = Flight.find(booking_params[:flight_id])
      @passenger_amount = booking_params[:passengers_attributes].to_h.count
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end

    def passenger_amount
      params[:number_of_tickets].to_i
    end
end
