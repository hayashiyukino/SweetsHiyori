class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @sweets_revues = SweetsRevue.page(params[:page]).per(6).order(created_at: :desc)
  end
end
