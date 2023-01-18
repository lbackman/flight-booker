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

  def self.search(departure_airport, destination_airport, departure_time)
    if [departure_airport, destination_airport, departure_time].any?
      where(['departure_airport_id = ? AND arrival_airport_id = ? AND departure_time >= ?', departure_airport, destination_airport, departure_time])
    else
      upcoming 
    end
  end
end
