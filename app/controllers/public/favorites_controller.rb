class Public::FavoritesController < ApplicationController

  def create
    sweets_revue = SweetsRevue.find(params[:sweets_revue_id])
    favorite = current_end_user.favorites.new(sweets_revue_id: sweets_revue.id)
    favorite.save
    redirect_to sweets_revue_path(sweets_revue)
  end

  def destroy
    sweets_revue = SweetsRevue.find(params[:sweets_revue_id])
    favorite = current_end_user.favorites.find_by(sweets_revue_id: sweets_revue.id)
    favorite.destroy
    redirect_to sweets_revue_path(sweets_revue)
  end

end
