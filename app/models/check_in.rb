class CheckIn < ApplicationRecord
  after_create :set_sms_time

  belongs_to :prescription_schedule
  has_one :prescription, through: :prescription_schedule
  validates :scheduled_date, presence: true
  validates :scheduled_time, presence: true

  has_one :text_message

  private

  def set_sms_time
    SendSmsJob.set(wait_until: ("#{self.scheduled_date} #{self.scheduled_time}").to_datetime).perform_later
  end
end
