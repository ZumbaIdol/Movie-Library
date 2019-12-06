class SessionsController < ApplicationController

  def destroy
    session.delete :user_id
    @current.user = nil
    redirect_to root_path
  end

  def new
  end

  def create
    if @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
#binding.pry
    session[:user_id] = @user.id
    render 'welcome/home'
  else
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user_id
      flash[:success] = "User successfully created!"
      redirect_to user_path(@user)
    else
      @error = "Login failed. Please try again."
      render '/sessions/new'
    end
  end
end

  private

  def auth
    request.env['omniauth.auth']
  end
end