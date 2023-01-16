# This file should contain all the record.id creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord.id of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Flight.delete_all
Airport.delete_all

lax = Airport.create(code: 'LAX')
jfk = Airport.create(code: 'JFK')
atl = Airport.create(code: 'ATL')
ord = Airport.create(code: 'ORD')
den = Airport.create(code: 'DEN')
bos = Airport.create(code: 'BOS')
mia = Airport.create(code: 'MIA')
hnl = Airport.create(code: 'HNL')
las = Airport.create(code: 'LAS')
abq = Airport.create(code: 'ABQ')

def random_future_time
  (Time.now + (6 + (rand*96).ceil).hours).beginning_of_hour
end

Flight.create(
  [
    {departure_airport_id: lax.id, arrival_airport_id: jfk.id, departure_time: random_future_time, flight_duration_minutes: 250},
    {departure_airport_id: jfk.id, arrival_airport_id: lax.id, departure_time: random_future_time, flight_duration_minutes: 240},
    {departure_airport_id: ord.id, arrival_airport_id: lax.id, departure_time: random_future_time, flight_duration_minutes: 180},
    {departure_airport_id: lax.id, arrival_airport_id: ord.id, departure_time: random_future_time, flight_duration_minutes: 185},
    {departure_airport_id: bos.id, arrival_airport_id: jfk.id, departure_time: random_future_time, flight_duration_minutes: 90},
    {departure_airport_id: jfk.id, arrival_airport_id: bos.id, departure_time: random_future_time, flight_duration_minutes: 90},
    {departure_airport_id: atl.id, arrival_airport_id: lax.id, departure_time: random_future_time, flight_duration_minutes: 200},
    {departure_airport_id: lax.id, arrival_airport_id: atl.id, departure_time: random_future_time, flight_duration_minutes: 205},
    {departure_airport_id: atl.id, arrival_airport_id: mia.id, departure_time: random_future_time, flight_duration_minutes: 100},
    {departure_airport_id: mia.id, arrival_airport_id: atl.id, departure_time: random_future_time, flight_duration_minutes: 100},
    {departure_airport_id: atl.id, arrival_airport_id: den.id, departure_time: random_future_time, flight_duration_minutes: 170},
    {departure_airport_id: den.id, arrival_airport_id: atl.id, departure_time: random_future_time, flight_duration_minutes: 170},
    {departure_airport_id: atl.id, arrival_airport_id: jfk.id, departure_time: random_future_time, flight_duration_minutes: 120},
    {departure_airport_id: jfk.id, arrival_airport_id: atl.id, departure_time: random_future_time, flight_duration_minutes: 120},
    {departure_airport_id: den.id, arrival_airport_id: jfk.id, departure_time: random_future_time, flight_duration_minutes: 200},
    {departure_airport_id: jfk.id, arrival_airport_id: den.id, departure_time: random_future_time, flight_duration_minutes: 210},
    {departure_airport_id: ord.id, arrival_airport_id: den.id, departure_time: random_future_time, flight_duration_minutes: 110},
    {departure_airport_id: den.id, arrival_airport_id: ord.id, departure_time: random_future_time, flight_duration_minutes: 110},
    {departure_airport_id: hnl.id, arrival_airport_id: lax.id, departure_time: random_future_time, flight_duration_minutes: 270},
    {departure_airport_id: lax.id, arrival_airport_id: hnl.id, departure_time: random_future_time, flight_duration_minutes: 260},
    {departure_airport_id: abq.id, arrival_airport_id: atl.id, departure_time: random_future_time, flight_duration_minutes: 130},
    {departure_airport_id: atl.id, arrival_airport_id: abq.id, departure_time: random_future_time, flight_duration_minutes: 130},
    {departure_airport_id: abq.id, arrival_airport_id: las.id, departure_time: random_future_time, flight_duration_minutes: 170},
    {departure_airport_id: las.id, arrival_airport_id: abq.id, departure_time: random_future_time, flight_duration_minutes: 170}
  ]
)
