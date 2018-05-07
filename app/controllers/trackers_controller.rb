class TrackersController < ApplicationController
  def index
  	@tracked = Show.joins(:favorites)
  end
end
