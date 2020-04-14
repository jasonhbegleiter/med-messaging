class Activity < ApplicationRecord
  has_many :trigger_resolutions
  has_many :trigger_resolution_episodes, through: :trigger_resolutions

  validates :name, uniqueness: true, presence: true
end
