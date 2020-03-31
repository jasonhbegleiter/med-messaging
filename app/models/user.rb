class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

  has_many :prescriptions
  has_many :prescription_schedules, through: :prescriptions

  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
