module FlightsHelper
  def invalid_ticket_amount?(number_of_tickets)
    !(1..4).include?(number_of_tickets.to_i)
  end
end
