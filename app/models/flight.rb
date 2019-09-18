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

class Flight < ApplicationRecord
  validates :duration, presence: true
  validates :start_datetime, presence: true
  validate :ensure_different_start_and_finish

  belongs_to :from_airport, { class_name: :Airport, foreign_key: :from_airport_id }
  belongs_to :to_airport, { class_name: :Airport, foreign_key: :to_airport_id }
  has_many :bookings
  has_many :passengers, through: :bookings

  scope :search_criteria, ->(from_airport, to_airport, start_datetime, finish_datetime) do
    where("from_airport_id = ? AND
          to_airport_id = ? AND
          start_datetime >= ? AND
          start_datetime < ?",
          from_airport,
          to_airport,
          start_datetime,
          finish_datetime)
    .includes(:from_airport, :to_airport)
  end

  def date_formatted
    start_datetime.strftime("%d/%m/%Y at %I:%M %P")
  end

  def formatted_date_only
    start_datetime.strftime("%a, %dth %B, %Y")
  end

  def formatted_time_only
    start_datetime.strftime("%H:%M %p")
  end

  def display_journey
    "#{self.from_airport.code} to #{self.to_airport.code}"
  end

  private
    def ensure_different_start_and_finish
      errors.add(:start_and_finish, "can't be the same") if same_start_and_finish?
    end

    def same_start_and_finish?
      from_airport_id == to_airport_id
    end
end
