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

FactoryBot.define do
  factory :booking do
    association :flight
  end
end
