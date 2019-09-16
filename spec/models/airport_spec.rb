# == Schema Information
#
# Table name: airports
#
#  id         :bigint           not null, primary key
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Airport, type: :model do
  subject(:airport) { FactoryBot.build(:airport) }

  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_length_of(:code).is_at_most(3) }
  end

  describe 'associations' do
    it { should have_many(:departing_flights).class_name(:Flight) }
    it { should have_many(:arriving_flights).class_name(:Flight) }
  end

  describe 'callbacks' do
    it 'converts code to upcase before save' do
      airport.save
      expect(airport.code).to eq(airport.code.upcase)
    end
  end
end
