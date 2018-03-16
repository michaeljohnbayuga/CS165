class TrackersController < ApplicationController
  def index
    @trackers = Tracker.where(user_id: current_user.id)
    @tracked = Show.joins(seasons: {episodes: :trackers}).where(trackers: {user_id: current_user.id}).distinct.order(start_year: :desc, name: :asc)
  end
end
