class CheckIn < ApplicationRecord
  belongs_to :prescription_schedule

  validates :completed_timestamp, presence: true
end
