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

FactoryBot.use_parent_strategy = false

FactoryBot.define do
  factory :flight do
    duration { (2..9).to_a.sample.hours }
    start_datetime { Faker::Time.between(from: DateTime.now, to: DateTime.now + 5.hours) }
    association :from_airport, factory: :airport
    association :to_airport, factory: :airport_2

    factory :flight_with_same_start_and_end do
      association :from_airport, factory: :airport_static
      association :to_airport, factory: :airport_static
    end

    # factory :flight_with_same_start_and_end do
    #   association :from_airport, factory: :airport_static
    #   association :to_airport, factory: :airport_static
    # end
  end
end
