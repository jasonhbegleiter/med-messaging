class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:check_schedule]
  def index
    @prescriptions = Prescription.where(user: current_user)
  end
  def new
    @prescription = Prescription.new


    @all_products = Product.all.map do |product|
      product.name
    end
  end

  def create
    product = Product.find_by(name: params[:prescription][:product])
    amount = params[:prescription][:amount].to_f
    instructions = instructions = params[:prescription][:instructions]
    end_date = Date.new(params[:prescription]["end_date(1i)"].to_i, params[:prescription]["end_date(2i)"].to_i, params[:prescription]["end_date(3i)"].to_i )
    start_date = Date.new(params[:prescription]["start_date(1i)"].to_i, params[:prescription]["start_date(2i)"].to_i, params[:prescription]["start_date(3i)"].to_i )
    @prescription = Prescription.new(product: product, amount: amount, instructions: instructions, end_date: end_date, start_date: start_date)
    @prescription.user = current_user

    if @prescription.save
      redirect_to root_path
    else
      render :new
    end
  end

  def check_schedule
    @prescription_schedules = @prescription.prescription_schedules
    if @prescription_schedules
      respond_to do |format|
        format.js { render "show_schedules.js.erb", prescription: @prescription, schedules: @prescription_schedules}
      end
    else
      flash[:notice] = "No schedules for current prescription"
      render :index
    end
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:prescription_id])
  end
end
