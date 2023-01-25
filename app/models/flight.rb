class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  paginates_per 15

  scope :upcoming, -> { 
    where("departure_time > ?", Time.now)
      .order(:departure_time)
      .includes(:departure_airport, :arrival_airport) 
    }

  def self.get_flight_dates
    flight_dates = Flight.where('departure_time > ?', Time.now).distinct.pluck('date(departure_time)').sort
  end 

  def self.search(departure_id, arrival_id, departure_time)
    searches = [:upcoming]

    searches << [:where, 'departure_airport_id = ?', departure_id] if departure_id && departure_id != ''
    searches << [:where, 'arrival_airport_id = ?', arrival_id] if arrival_id && arrival_id != ''
    searches << [:where, 'date(departure_time) = ?', departure_time] if departure_time && departure_time != ''

    searches.inject(Flight) { |flight, where_and_args| flight.send(*where_and_args) }
  end
end
