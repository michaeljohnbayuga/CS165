class SessionsController < ApplicationController
  def create
    valid_user = User.authenticate(params[:username],params[:password])
    if valid_user
      session[:user_id] = valid_user.id
      redirect_to '/'
    else
      flash[:error_header]="Error sigining in."
      flash[:error_body]=User.create.errors[:username].join(", ")
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end
end
