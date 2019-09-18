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

class PassengerBookingDetail < ApplicationRecord
  validates :passenger_id, uniqueness: { scope: :booking_id,
                                         message: 'already has a booking on this flight' }

  belongs_to :booking
  belongs_to :passenger
end
