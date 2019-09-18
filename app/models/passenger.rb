# == Schema Information
#
# Table name: passengers
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :passenger_booking_details
  has_many :bookings, through: :passenger_booking_details
  has_many :flights, through: :bookings
end
