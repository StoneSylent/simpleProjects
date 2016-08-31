class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.user_name
      redirect_to main_home_path
    else
     redirect_to login_url, notice: "Invalid login details"
    end
  end

  def destroy
  	session[:user_id] = nil
  	render main_home_path
  end

end
