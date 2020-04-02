class PrescriptionSchedulesController < ApplicationController

  def create
    days_of_week = ""
    params.each do |param|
      if param[0].include? "day"
        days_of_week += param[0]
        days_of_week += ','
      end
    end
    if days_of_week[-1] == ','
      days_of_week.chop
    end
    as_needed = params[:as_needed] ? true : false
    prescription = Prescription.find(params[:prescription_id])
    if params[:hours].length == 1
      scheduled_time = "0#{params[:hours]}:#{params[:minutes]}"
    else
      scheduled_time = "#{params[:hours]}:#{params[:minutes]}"
    end
    prescription_schedule = PrescriptionSchedule.create(day_of_week: days_of_week, as_needed: as_needed, prescription: prescription, time_of_day: scheduled_time)

    redirect_to prescriptions_path
  end

end
