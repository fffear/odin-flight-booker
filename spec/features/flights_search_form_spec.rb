require 'rails_helper'

feature 'Flight search form' do
  # given(:airport_1) { FactoryBot.build(:airport, code: "NYC") }
  # given(:airport_2) { FactoryBot.build(:airport, code: "LAX") }
  given(:flight) { FactoryBot.build(:flight) }
  
  scenario 'has a form to search via flight select criteria' do
    visit root_url
    expect(page).to have_content("From Airport")
    expect(page).to have_content("To Airport")
    expect(page).to have_content("Number of Passengers")
    expect(page).to have_content("Date")
    expect(page).to have_selector("select#flight_from_airport_id")
    expect(page).to have_selector("select#flight_to_airport_id")
    expect(page).to have_selector("select#flight_num_passengers")
    expect(page).to have_selector("select#flight_start_datetime")
    expect(page).to have_selector("input[type=submit]")
  end

  scenario 'displays search results form form after entering search details' do
    flight.save
    visit root_url
    select("#{flight.from_airport.code}", from: 'flight_from_airport_id')
    select("#{flight.to_airport.code}", from: 'flight_to_airport_id')
    select("2", from: 'flight_num_passengers')
    select("#{flight.date_formatted}", from: 'flight_start_datetime')
    click_button("Search")
    expect(page).to have_content("#{flight.from_airport.code} to #{flight.to_airport.code}")
    expect(page).to have_selector("input[type=hidden][value=2]#booking_num_passengers", visible: false)
  end
end