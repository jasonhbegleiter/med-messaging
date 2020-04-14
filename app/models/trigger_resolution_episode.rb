class TriggerResolutionEpisode < ApplicationRecord
  belongs_to :health_episode
  belongs_to :trigger_resolution
end
