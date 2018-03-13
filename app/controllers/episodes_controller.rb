class EpisodesController < ApplicationController
  def create
    @episode = Episode.new(episode_params)
    @episode.save
  end

  def edit
    @episode = Episode.find(params[:id])
    @season = Season.find(@episode.season_id)
    @show = Show.find(@season.show_id)
  end

  def update
    @episode = Episode.find(params[:id])
    @season = Season.find(@episode.season_id)
    @show = Show.find(@season.show_id)


    if @episode.update(episode_params)
      flash[:success_header] = "Season " + @season.season_no.to_s + ", Episode " + @episode.episode_no.to_s + " of " + @show.name + " has been updated!"
      flash[:success_body] = "The changes have been saved to the database."
      redirect_to @season
    else
      render 'edit'
    end
  end

  def destroy
    @episode = Episode.find(params[:id])
    @season = Season.find(@episode.season_id)
    @show = Show.find(@season.show_id)
    @episode.destroy

    flash[:success_header] = "Season " + @season.season_no.to_s + ", Episode " + @episode.episode_no.to_s + " of " + @show.name + " has been deleted."
    flash[:success_body] = "The changes have been saved to the database."

    redirect_to season_path(@season)
  end

  private
    def episode_params
      params.require(:episode).permit(:episode_no, :showep_no, :title, :air_date)
    end
end
