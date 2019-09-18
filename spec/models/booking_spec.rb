# == Schema Information
#
# Table name: bookings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flight_id  :integer          not null
#
# Indexes
#
#  index_bookings_on_flight_id  (flight_id)
#

require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'Associations' do
    it { should belong_to(:flight) }
    it { should have_many(:passenger_booking_details) }
    it { should have_many(:passengers) }
  end
end
