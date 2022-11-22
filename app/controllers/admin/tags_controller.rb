class Admin::TagsController < ApplicationController
    before_action :authenticate_admin!
  
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "タグの登録に成功しました"
      redirect_to admin_tags_path
    else
      @tags = Tag.all
      flash[:notice] = "タグの登録に失敗しました"
      render :index
    end
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
      if @tag.update(tag_params)
        flash[:notice] = "タグの更新に成功しました"
        redirect_to admin_tags_path
      else
        flash[:notice] = "タグの更新に失敗しました"
        render :edit
      end
  end


  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
