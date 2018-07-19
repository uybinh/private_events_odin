class UsersController < ApplicationController
  before_action :signed_in_user, except: [:new, :create]

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created!"
      sign_in @user
      redirect_to @user
    else
      flash.now[:danger] = "Failed to create user"
      render :new
    end
  end

  def show
    @user = current_user
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def signed_in_user
      unless signed_in?
        flash[:info] = "Please sign in first"
        redirect_to signin_path
      end
    end
end
