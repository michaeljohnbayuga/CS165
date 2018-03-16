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
      redirect_to '/shows'
    else
      flash[:error_header]="Error sigining in."
      flash[:error_body]=@user.errors.full_messages[0]+"."
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
      redirect_to '/profile'
    else
      render 'index'
    end
  end

  def destroy
    @user = User.find(current_user.id)
    session[:user_id] = nil
    @user.destroy

    flash[:success_header] = "Your account has been deleted."
    flash[:success_body] = "See you!"

    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :name, :password, :password_confirmation)
    end

end
