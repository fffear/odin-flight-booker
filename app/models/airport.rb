# == Schema Information
#
# Table name: airports
#
#  id         :bigint           not null, primary key
#  code       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Airport < ApplicationRecord
  validates :code, presence: true, uniqueness: true, length: { maximum: 3 }

  has_many :departing_flights, { class_name: :Flight, foreign_key: :from_airport_id }
  has_many :arriving_flights, { class_name: :Flight, foreign_key: :to_airport_id }

  before_save :upcase_code

  private
    def upcase_code
      code.upcase!
    end
end
