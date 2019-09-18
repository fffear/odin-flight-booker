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

FactoryBot.define do
  factory :passenger do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
  end
end
