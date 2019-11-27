class SessionsController < ApplicationController

  def destroy
    session.delete :user_id
    @current.user = nil
    redirect_to root_path
  end

  def new
  end

  def def create
    @user = User.find_by(name: params[:user][:name])
    if @user && user.authenticate(params[:user][:password])
      session[:user_id] = @user_id
      flash[:success] = "User successfully created!"
      redirect_to user_path(@user)
    else
      @error = "Login failed. Please try again."
      render '/sessions/new'
    end
  end 
end