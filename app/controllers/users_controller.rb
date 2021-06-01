class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
  
    if @user.save
      login_user!(@user)
      render :show
    else
      render :new
    end
  end
  
  def show
    render :show
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end