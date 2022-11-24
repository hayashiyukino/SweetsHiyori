class Public::FavoritesController < ApplicationController
  before_action :authenticate_end_user!

  # def index
  #   @sweets_revues = SweetsRevue.all.page(params[:page]).per(9).order(created_at: :desc)
  # end

  def create
    @sweets_revue = SweetsRevue.find(params[:sweets_revue_id])
    favorite = current_end_user.favorites.new(sweets_revue_id: @sweets_revue.id)
    favorite.save
  end

  def destroy
    @sweets_revue = SweetsRevue.find(params[:sweets_revue_id])
    favorite = current_end_user.favorites.find_by(sweets_revue_id: @sweets_revue.id)
    favorite.destroy
  end
  


end