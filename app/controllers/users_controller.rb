class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :name, :email, :password)
    end
end
