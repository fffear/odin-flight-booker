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

require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  describe 'Associations' do
    it { should have_many(:passenger_booking_details) }
    it { should have_many(:bookings).through(:passenger_booking_details) }
    it { should have_many(:flights).through(:bookings) }
  end
end
