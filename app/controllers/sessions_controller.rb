class SessionsController < ApplicationController
  def create
    valid_user = User.authenticate(params[:username],params[:password])
    if valid_user
      session[:user_id] = valid_user.id
      redirect_to '/'
    else
      redirect_to '/shows'
    end
  end

  def destroy
  end
end
