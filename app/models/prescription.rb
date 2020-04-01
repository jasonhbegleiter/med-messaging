class Prescription < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :prescription_schedules
  has_many :check_ins, through: :prescription_schedules

  after_initialize :init

  def init
    self.active = true
  end
end
