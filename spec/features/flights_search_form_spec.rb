require 'rails_helper'

feature 'Flight search form' do
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

  scenario 'displays search results form after entering search details' do
    flight.save
    fill_search_form(flight)
    expect(page).to have_content("#{flight.from_airport.code} to #{flight.to_airport.code}")
    expect(page).to have_selector("input[type=hidden][value=2]#booking_num_passengers", visible: false)
    expect(page).to have_selector("input[type=submit][value='Create Booking']")
    fill_search_results_form(flight)
    expect(page).to have_content("New Booking")
  end

  scenario 'redirect back and displays search results form when no flight is selected' do
    flight.save
    fill_search_form(flight)
    check_search_results(flight)
    click_button("Create Booking")
    check_search_results(flight)
  end
end