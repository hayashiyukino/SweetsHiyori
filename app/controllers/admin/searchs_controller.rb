# class Admin::SearchsController < ApplicationController
#   before_action :authenticate_admin!
  
#   def index
#     @searchs = Search.all
#     @search = Search.new
#     @search_name = ""
#   end

#   def create
#     @search = Search.new(search_params)
#     if @search.save
#       flash[:notice] = "登録に成功しました"
#       redirect_to admin_searchs_path
#     else
#       @searchs = Search.all
#       flash[:notice] = "登録に失敗しました"
#       render :index
#     end
#   end
  
#   def edit
#     @search = Search.find(params[:id])
#   end
  
#   def update
#     @search = Search.find(params[:id])
#       if @search.update(search_params)
#         flash[:notice] = "更新に成功しました"
#         redirect_to admin_search_path
#       else
#         flash[:notice] = "更新に失敗しました"
#         render :edit
#       end
#   end
  
#   private

#   def search_params
#     params.require(:search).permit(:name)
#   end
# end
