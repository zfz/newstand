class UsersController < ApplicationController
  before_action :require_user

  def new
    @user = User.new
  end
  
  def create
    user = User.create(user_params)
    if user.save
      redirect_to root_path
    else
      redirect_to sign_up_path
    end
  end

  def show
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find_by(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
