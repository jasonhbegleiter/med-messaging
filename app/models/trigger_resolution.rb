class TriggerResolution < ApplicationRecord
  belongs_to :activity
  belongs_to :product

  validates :type, presence: true
end
