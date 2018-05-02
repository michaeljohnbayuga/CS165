class FavoriteShowsController < ApplicationController
  before_action :set_show
  
  def create
    if Favorite.create(show: @show, user: current_user)
      redirect_to @show, notice: 'show has been favorited'
    else
      redirect_to @show, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(show_id: @show.id, user_id: current_user.id).first.destroy
    redirect_to @show, notice: 'show is no longer in favorites'
  end
  
  private
  
  def set_show
    @show = Show.find(params[:show_id] || params[:id])
  end
end