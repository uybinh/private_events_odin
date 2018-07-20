class UsersController < ApplicationController
  before_action :signed_in_user, except: [:new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]
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
    @user = User.find(params[:id])
    @events = @user.created_events.includes(:creator) 
    @previous_events = @user.previous_events.includes(:creator) 
    @upcoming_events = @user.upcoming_events.includes(:creator) 
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

    def correct_user
      @user = User.find(params[:id]) 
      unless current_user?(@user)
        flash[:danger] = "You can't edit/delete other creator's events"
        redirect_to root_path
      end
    end
end
