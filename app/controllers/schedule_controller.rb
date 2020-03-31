class ScheduleController < ApplicationController
  def index
    PrescriptionSchedule.where(user: current_user)
  end
end
