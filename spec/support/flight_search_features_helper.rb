module FlightSearchFeaturesHelper
  def fill_search_form(flight)
    visit root_url
    select("#{flight.from_airport.code}", from: 'flight_from_airport_id')
    select("#{flight.to_airport.code}", from: 'flight_to_airport_id')
    select("2", from: 'flight_num_passengers')
    select("#{flight.date_formatted}", from: 'flight_start_datetime')
    click_button("Search")
  end

  def fill_search_results_form(flight)
    choose("booking_flight_id_#{flight.id}")
    click_button("Create Booking")
  end

  def check_search_results(flight)
    expect(page).to have_selector("input[type=radio][name='booking[flight_id]'][value=#{flight.id}]")
    expect(page).to have_content("#{flight.from_airport.code} to #{flight.to_airport.code}")
    expect(page).to have_selector("input[type=hidden][value=2]#booking_num_passengers", visible: false)
    expect(page).to have_selector("input[type=submit][value='Create Booking']")
  end
end