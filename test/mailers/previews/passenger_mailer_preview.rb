# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/passenger_mailer/confirmation_email
  def confirmation_email
    @passenger = Passenger.first
    @booking = Booking.find(@passenger.booking_id)
    PassengerMailer.with(booking: @booking).confirmation_email(@passenger)
  end

end
