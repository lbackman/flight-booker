class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  scope :upcoming, -> { 
    where("departure_time > ?", Time.now)
      .order(:departure_time)
      .includes(:departure_airport, :arrival_airport) 
    }

  def self.get_flight_dates
    flight_dates = Flight.upcoming.distinct(:departure_time).pluck(:departure_time)
  end 

  def self.search(departure_id, arrival_id, departure_time)
    searches = []
    searches << [:where, 'departure_airport_id = ?', departure_id] if departure_id && departure_id != ''
    searches << [:where, 'arrival_airport_id = ?', arrival_id] if arrival_id && arrival_id != ''
    if departure_time && departure_time != ''
      searches << [:where, 'departure_time >= ? AND departure_time < ?', departure_time.to_datetime.midnight, departure_time.to_datetime.midnight + 1.day]
    else
      searches << [:upcoming]
    end
    searches.inject(Flight) { |flight, where_and_args| flight.send(*where_and_args) }
  end
end
