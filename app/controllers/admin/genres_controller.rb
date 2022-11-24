class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの登録に成功しました"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      flash[:notice] = "ジャンルの登録に失敗しました"
      render :index
    end
  end

  # def edit
  #   @genre = Genre.find(params[:id])
  # end

  # def update
  #   @genre = Genre.find(params[:id])
  #     if @genre.update(genre_params)
  #       flash[:notice] = "ジャンルの更新に成功しました"
  #       redirect_to admin_genres_path
  #     else
  #       flash[:notice] = "ジャンルの更新に失敗しました"
  #       render :edit
  #     end
  # end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end
  
  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
