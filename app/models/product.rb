class Product < ApplicationRecord
  has_many :prescriptions
  has_many :trigger_resolutions
  has_many :trigger_resolution_episodes, through: :trigger_resolutions
end
