class PrescriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @prescriptions = current_user.prescriptions.where(active: true)
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @product = Product.find(params[:product_id])
    @prescription = Prescription.new(prescription_params)
    @prescription.create!
  end

  def prescriptions_params
    params.require(:user, :product).permit(:amount, :instructions, :start_date, :end_date)
  end

end
