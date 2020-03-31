class ScheduleController < ApplicationController
  def index
    # still needs to be tested
    @schedule = CheckIn.where(scheduled_date: Date.today)
  end
end
