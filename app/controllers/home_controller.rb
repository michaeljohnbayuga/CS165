class HomeController < ApplicationController
  def show
    @episodes = Episode.where(air_date = Date.today.strftime("%Y-%m-%d"))
  end
end
