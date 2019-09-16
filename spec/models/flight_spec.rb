# == Schema Information
#
# Table name: flights
#
#  id              :bigint           not null, primary key
#  duration        :integer          not null
#  start_datetime  :datetime         not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  from_airport_id :integer          not null
#  to_airport_id   :integer          not null
#

require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    subject(:flight) { FactoryBot.build(:flight) }

    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:start_datetime) }
    it 'should validate from_airport is different to to_airport' do
      flight.to_airport_id = flight.from_airport_id
      expect(flight).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:from_airport).class_name(:Airport) }
    it { should belong_to(:to_airport).class_name(:Airport) }
  end
end
