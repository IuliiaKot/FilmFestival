class UsersController < ApplicationController
  # include UsersHelper
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/filmfestival'
    else
      @errors = @user.errors.full_messages
      # render json: (review.errors)
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :first_name, :email, :password)
    end
end
