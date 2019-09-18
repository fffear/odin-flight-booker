require 'rails_helper'

feature 'Booking form' do
  given(:flight) { FactoryBot.build(:flight) }
  background(:each) do
    flight.save
    fill_search_form(flight)
    fill_search_results_form(flight)
  end

  scenario 'has a form which allows entering passenger details' do
    expect(page).to have_content("Passengers")
    expect(page).to have_selector("input#booking_passengers_attributes_0_name")
    expect(page).to have_selector("input#booking_passengers_attributes_1_name")
    expect(page).to have_selector("input[type=submit][value='Create Booking']")
  end

  scenario 'valid passenger information entered' do
    models_count_before_booking_creation
    fill_in_passenger_details
    click_button("Create Booking")
    models_count_after_booking_creation
    check_page_rendered_after_successful_booking(flight)
  end

  scenario 'invalid passenger information entered' do
    models_count_before_booking_creation
    half_fill_in_passenger_details
    click_button("Create Booking")
    models_count_before_booking_creation
    check_page_rendered_after_unsuccessful_booking(flight)
  end
end