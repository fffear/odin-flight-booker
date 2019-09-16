# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.delete_all
Flight.delete_all

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

flight_1 = Flight.create(from_airport_id: 1,
                         to_airport_id: 2,
                         start_datetime: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 1.day + 5.hours),
                         duration: (2..9).to_a.sample.hours)

flight_2 = Flight.create(from_airport_id: 3,
                         to_airport_id: 4,
                         start_datetime: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 1.day + 5.hours),
                         duration: (2..9).to_a.sample.hours)

flight_3 = Flight.create(from_airport_id: 5,
                         to_airport_id: 6,
                         start_datetime: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 1.day + 5.hours),
                         duration: (2..9).to_a.sample.hours)

flight_4 = Flight.create(from_airport_id: 7,
                         to_airport_id: 8,
                         start_datetime: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 1.day + 5.hours),
                         duration: (2..9).to_a.sample.hours)

flight_5 = Flight.create(from_airport_id: 9,
                         to_airport_id: 10,
                         start_datetime: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 1.day + 5.hours),
                         duration: (2..9).to_a.sample.hours)