class Admin::SweetsRevuesController < ApplicationController
  before_action :authenticate_admin!
  
  def show
  end
end
