class UsersController < ApplicationController
   before_action :set_user, only: [:edit, :update]

  def new
        
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
  
  end

  def update
    if @user.update(user_params)
      redirect_to new_user_path
    else
      render :edit
    end
  end

  private 

  def set_user
      @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
