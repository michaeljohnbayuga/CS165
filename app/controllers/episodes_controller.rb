class EpisodesController < ApplicationController
  def create
    @episode = Episode.new(episode_params)
    @episode.save
  end

  private
    def episode_params
      params.require(:episode).permit(:episode_no, :showep_no, :title, :air_date)
    end
end
