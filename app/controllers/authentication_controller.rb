class AuthenticationController < ApplicationController

  def new
    session[:user_id] = current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] =  user.id
      flash[:notice] = "logged in"
      redirect_to root_path
    else
      flash[:notice] = "oops something went horribly wrong"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
