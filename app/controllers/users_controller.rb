class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:success_header]="You signed up successfully."
      flash[:success_body]="Please log in to your account to start tracking your shows."
      redirect_to '/'
    else
      flash[:error_header]="Error sigining in."
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :name, :password)
    end

end
