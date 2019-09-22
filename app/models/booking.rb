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

class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passenger_booking_details, inverse_of: :booking
  has_many :passengers, through: :passenger_booking_details
  accepts_nested_attributes_for :passengers

  def create_associated_passengers(passengers_attributes)
    if passengers_attributes.to_h.any? { |k, v| v[:name].blank? || v[:email].blank? }
      passengers_attributes.each do |key, passengers_attribute|
        self.passengers.build(name:  passengers_attribute[:name],
                               email: passengers_attribute[:email])
      end
    else
      self.save
      passengers_attributes.each do |key, passengers_attribute|
        if passenger = Passenger.find_by(email: passengers_attribute[:email])
          self.passengers << passenger
        else
          self.passengers.create(name:  passengers_attribute[:name],
                                 email: passengers_attribute[:email])
        end
      end
    end
  end
end
