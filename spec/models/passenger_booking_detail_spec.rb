# == Schema Information
#
# Table name: passenger_booking_details
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  booking_id   :integer          not null
#  passenger_id :integer          not null
#
# Indexes
#
#  index_passenger_booking_details_on_booking_id_and_passenger_id  (booking_id,passenger_id) UNIQUE
#  index_passenger_booking_details_on_passenger_id_and_booking_id  (passenger_id,booking_id)
#

require 'rails_helper'

RSpec.describe PassengerBookingDetail, type: :model do
  describe 'Validations' do
    subject(:pbd) { FactoryBot.create(:passenger_booking_detail) }
    it do 
      should validate_uniqueness_of(:passenger_id)
        .scoped_to(:booking_id)
        .with_message('already has a booking on this flight') 
    end
  end

  describe 'Associations' do
    it { should belong_to(:booking) }
    it { should belong_to(:passenger) }
  end
end
