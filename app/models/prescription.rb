class Prescription < ApplicationRecord
  after_create :set_defaults


  belongs_to :user
  belongs_to :product
  has_many :prescription_schedules
  has_many :check_ins, through: :prescription_schedules


  validates :product, presence: true
  validates :amount, presence:true
  validates :instructions, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true


  private

  def set_defaults
    self.update(active: true)
  end
end
