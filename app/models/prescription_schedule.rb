class PrescriptionSchedule < ApplicationRecord
  after_initialize :set_defaults
  belongs_to :prescription
  has_many :check_ins

  validates :prescription, presence: true
  validates :day_of_week, presence: true
  validates :time_of_day, presence: true

  def set_defaults
    self.update(as_needed: false)
    self.update(day_of_week: "Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday")
  end
end
