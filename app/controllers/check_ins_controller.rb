class CheckInsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_check_in, only: [:update]


  def update
    @check_in.update(status: 'complete')

    # redirect_to root_path
  end

  private

  def set_check_in
    @check_in = CheckIn.find(params[:id])
  end

end
