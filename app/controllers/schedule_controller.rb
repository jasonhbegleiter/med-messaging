class ScheduleController < ApplicationController
  before_action :authenticate_user!

  def index
    # @prescription_schedules_today = current_user.prescription_schedules.select do |schedule|
    #   schedule.day_of_week.split(",").include? Date.today.strftime("%A")
    # end

    @check_ins = current_user.check_ins.where(scheduled_date: Date.today)
  end
end
