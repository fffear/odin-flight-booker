# == Schema Information
#
# Table name: airports
#
#  id         :bigint           not null, primary key
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :airport do
    code { Faker::Name.initials(number: 3).downcase }

    factory :airport_static do
      code { "NYC" }
    end

    factory :airport_2 do
      code { Faker::Name.initials(number: 3).downcase }
    end
  end
end
