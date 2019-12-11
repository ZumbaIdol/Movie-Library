class UsersController < ApplicationController
  before_action :if_not_logged_in, only: [:show]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path
    else
      render '/users/new'
    end

    def show
      @user = current_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end