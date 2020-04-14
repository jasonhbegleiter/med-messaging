class HealthEpisode < ApplicationRecord
  has_many :trigger_resolution_episodes
  has_many :episode_symptoms
end
