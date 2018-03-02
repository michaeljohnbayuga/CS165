class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
  end
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
  def edit
    @user = User.find(current_user.id)
  end
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:success_header] = "Your profile has been updated!"
      flash[:success_body] = "The changes have been saved to the database."
      redirect_back(fallback_location: root_path)
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :name, :password)
    end

end
