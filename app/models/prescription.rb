class Prescription < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :prescription_schedules
  has_many :check_ins, through: :prescription_schedules
end
