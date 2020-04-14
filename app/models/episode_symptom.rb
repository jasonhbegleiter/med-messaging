class EpisodeSymptom < ApplicationRecord
  belongs_to :symptom
  belongs_to :health_episode
end
