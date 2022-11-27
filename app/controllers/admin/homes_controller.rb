class Admin::HomesController < ApplicationController
  # before_action :authenticate_admin!

  def top
    @sweets_revues = SweetsRevue.all.page(params[:page]).per(12).order(created_at: :desc)
    @sweets_revue = SweetsRevue.new
  end
end
