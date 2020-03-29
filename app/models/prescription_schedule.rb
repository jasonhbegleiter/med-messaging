class PrescriptionSchedule < ApplicationRecord
  belongs_to :prescription
  has_many :check_ins
end
