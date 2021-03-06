class UsersController < ApplicationController

  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    if current_user == @user
      render 'show'
    else
      redirect_to root_path
    end
  end
end