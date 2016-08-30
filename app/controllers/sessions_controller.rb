class SessionsController < ApplicationController
  def new
  end

  def create
    # debugger
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to '/filmfestival'
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id]= nil
    redirect_to '/sessions/login'
  end

end
