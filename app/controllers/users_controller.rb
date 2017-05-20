class UsersController < ApplicationController

  def index
    @users = User.all_except(current_user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "<strong>#{@user.email}</strong> was successfully created"
    else
      flash.now[:warning] = "Something went wrong"
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end

