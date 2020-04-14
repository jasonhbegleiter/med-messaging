class Symptom < ApplicationRecord
  has_many :episode_symptoms
  has_many :health_episodes, through: :episode_symptoms

  validates :name, uniqueness: true, presence: true
end
