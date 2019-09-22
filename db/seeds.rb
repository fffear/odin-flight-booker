# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.delete_all
Flight.delete_all
Booking.delete_all
Passenger.delete_all
PassengerBookingDetail.delete_all

airport_1 = Airport.create!(code: 'NYC')
airport_2 = Airport.create!(code: 'SFO')
airport_3 = Airport.create!(code: 'LAX')
airport_4 = Airport.create!(code: 'DEN') 
airport_5 = Airport.create!(code: 'SEA')
airport_6 = Airport.create!(code: 'LAS')
airport_7 = Airport.create!(code: 'BOS') 
airport_8 = Airport.create!(code: 'MIA')
airport_9 = Airport.create!(code: 'PHX')
airport_10 = Airport.create!(code: 'PHL')



flight_1 = Flight.create(from_airport_id: airport_1.id,
                         to_airport_id: airport_2.id,
                         start_datetime: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 1.day + 5.hours),
                         duration: (2..9).to_a.sample.hours)

flight_2 = Flight.create(from_airport_id:airport_3.id,
                         to_airport_id: airport_4.id,
                         start_datetime: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 1.day + 5.hours),
                         duration: (2..9).to_a.sample.hours)

flight_3 = Flight.create(from_airport_id: airport_5.id,
                         to_airport_id: airport_6.id,
                         start_datetime: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 1.day + 5.hours),
                         duration: (2..9).to_a.sample.hours)

flight_4 = Flight.create(from_airport_id: airport_7.id,
                         to_airport_id: airport_8.id,
                         start_datetime: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 1.day + 5.hours),
                         duration: (2..9).to_a.sample.hours)

flight_5 = Flight.create(from_airport_id: airport_9.id,
                         to_airport_id: airport_10.id,
                         start_datetime: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 1.day + 5.hours),
                         duration: (2..9).to_a.sample.hours)


booking_1 = Booking.create(flight_id: flight_1.id)

booking_1.passengers.create(name: "Test Passenger 1",
                            email: "testpassenger1@example.com")

booking_1.passengers.create(name: "Test Passenger 2",
                            email: "testpassenger2@example.com")