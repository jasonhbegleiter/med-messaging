class CheckInsController < ApplicationController
  before_action :authenticate_user!

  def create
    requirement_type = params[:requirement_type] == 'true' ? 'required' : 'as_needed'
    prescription_schedule = PrescriptionSchedule.find(params[:prescription_schedule].to_i)
    @check_in = CheckIn.new(prescription_schedule: prescription_schedule, requirement_type: 'required', completed_timestamp: Time.now, status: 'complete', scheduled_date: Date.today)
    @check_in.save!

    p '--------------------------------------------------------'
    redirect_to root_path
  end

end
