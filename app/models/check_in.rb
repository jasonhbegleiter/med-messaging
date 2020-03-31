class CheckIn < ApplicationRecord
  belongs_to :prescription_schedule
  has_one :prescription, through: :prescription_schedule
  validates :scheduled_date, presence: true
  validates :scheduled_time, presence: true

end
