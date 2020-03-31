class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

  has_many :prescriptions
  has_many :prescription_schedules, through: :prescriptions
  has_many :check_ins, through: :prescription_schedules


  validates :email, uniqueness: true, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
