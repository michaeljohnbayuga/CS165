class TrackersController < ApplicationController
  def index
    @trackers = Tracker.where(user_id: current_user.id)
    @tracked = Show.joins(seasons: {episodes: :trackers}).where(trackers: {user_id: 1}).distinct
  end

  def show
    @tracker = Tracker.where(user_id: current_user.id)
  end

  def create
    @tracker = Tracker.new
    # user = User.find(current_user.id)
    @tracker.user_id = current_user.id
    @tracker.episode_id = params[:ep_id]
    @tracker.save
    redirect_to '/shows'
  end
end
