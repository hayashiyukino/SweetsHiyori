class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all.page(params[:page]).per(6)
  end
  
  def show
  end

  def edit
  end
end
