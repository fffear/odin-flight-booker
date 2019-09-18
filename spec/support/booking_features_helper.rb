module BookingFeaturesHelper
  def fill_in_passenger_details
    fill_in("booking_passengers_attributes_0_name", with: "Test Name 1")
    fill_in("booking_passengers_attributes_0_email", with: "test1@example.com")
    fill_in("booking_passengers_attributes_1_name", with: "Test Name 2")
    fill_in("booking_passengers_attributes_1_email", with: "test2@example.com")
  end

  def half_fill_in_passenger_details
    fill_in("booking_passengers_attributes_0_name", with: "Test Name 1")
    fill_in("booking_passengers_attributes_0_email", with: "test1@example.com")
  end

  def check_page_rendered_after_successful_booking(flight)
    expect(page).to have_content("#{flight.from_airport.code}")
    expect(page).to have_content("#{flight.to_airport.code}")
    expect(page).to have_content("Name: Test Name 1")
    expect(page).to have_content("Email: test1@example.com")
    expect(page).to have_content("Name: Test Name 2")
    expect(page).to have_content("Email: test2@example.com")
  end

  def check_page_rendered_after_unsuccessful_booking(flight)
    expect(page).to have_selector("input#booking_passengers_attributes_0_name[value='Test Name 1']")
    expect(page).to have_selector("input#booking_passengers_attributes_0_email[value='test1@example.com']")
    expect(page).to have_selector("input#booking_passengers_attributes_1_name[value='']")
    expect(page).to have_selector("input#booking_passengers_attributes_1_email[value='']")
    expect(page).to have_selector("input[type=submit][value='Create Booking']")
  end

  def models_count_before_booking_creation
    expect(Booking.all.count).to eq(0)
    expect(Passenger.all.count).to eq(0)
    expect(PassengerBookingDetail.all.count).to eq(0)
  end

  def models_count_after_booking_creation
    expect(Booking.all.count).to eq(1)
    expect(Passenger.all.count).to eq(2)
    expect(PassengerBookingDetail.all.count).to eq(2)
  end
end