class TrackersController < ApplicationController
  def index
      @tracked = Show.joins(:favorites).where('favorites.user_id' => current_user.id)
    end
end
