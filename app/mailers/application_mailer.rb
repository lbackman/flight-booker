class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("noreply@odinair.com", "Odin Airlines Bookings")
  layout "mailer"
end
