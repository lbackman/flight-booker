class PassengerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.passenger_mailer.confirmation_email.subject
  #
  def confirmation_email(passenger, booking)
    @booking = booking
    @url     = booking_url(@booking, host: 'localhost:3000')
    @email   = passenger.email
    @name    = passenger.name

    mail(to: @email, subject: "Information about your booking on flight #{@booking.flight_id}")
  end
end
