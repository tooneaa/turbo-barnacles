class SessionsController < ApplicationController
before_action :redirect_from_login, only: [:new, :create]
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]= "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "There is something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to login_path
  end

  private
  def redirect_from_login
    if logged_in?
      flash[:info] = "You have already logged in"
      redirect_to root_path
    end
  end

end
