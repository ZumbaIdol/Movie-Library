class SessionsController < ApplicationController

  def destroy
    session.delete :user_id
    @current.user = nil
    redirect_to root_path
  end

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "User successfully created!"
      redirect_to user_path(@user)
    else
      @error = "Login failed. Please try again."
      render '/sessions/new'
    end
  end

  def omniauth
    @user = User.from_omniauth(auth)
  # end

  session[:user_id] = @user.id
  redirect_to user_path(@user)
end

  private

  def auth
    request.env['omniauth.auth']
  end
end