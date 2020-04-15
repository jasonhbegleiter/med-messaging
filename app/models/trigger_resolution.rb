class TriggerResolution < ApplicationRecord
  belongs_to :activity
  belongs_to :product

  validates :category, presence: true
end
