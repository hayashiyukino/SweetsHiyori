class Public::HomesController < ApplicationController
  def top
    @sweets_revues = SweetsRevue.all.page(params[:page]).per(10).order(created_at: :desc)
    @sweets_revue = SweetsRevue.new

  end

  def about
  end

end
