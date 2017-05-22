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
      flash[:success] = "<strong>#{@user.name}</strong> was successfully created"
    else
      flash.now[:warning] = "Something went wrong"
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "<strong>#{@user.name}</strong> was successfully updates"
      redirect_to users_path
    else
      flash.now[:warning] = "somthing went wrong"
      render 'edit'
    end                                         
  end

  def destory
    User.find(params[:id]).destroy
    flash[:success] = "User removed"
    redirect_to user_path
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :admin)
  end
end

