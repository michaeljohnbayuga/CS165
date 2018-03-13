class SeasonsController < ApplicationController
  def create
    @season = Season.new(season_params)
    @season.save
  end

  def show
    @season = Season.find(params[:id])
    @show = Show.find(@season.show_id)
    @seasons = @show.seasons.order(season_no: :asc)
    @episodes = @season.episodes.order(episode_no: :asc)
  end

  def edit
    @season = Season.find(params[:id])
    @show = Show.find(@season.show_id)
  end

  def update
    @season = Season.find(params[:id])
    @show = Show.find(@season.show_id)

    if @season.update(season_params)
      redirect_to @show
    else
      render 'edit'
    end
  end

  def destroy
    @season = Season.find(params[:id])
    @show = Show.find(@season.show_id)
    redirect_to show_path(@show)
  end

  def watch
    @tracker = Tracker.new
    @tracker.user_id = current_user.id
    @tracker.episode_id = params[:id]
    @tracker.save
    redirect_back(fallback_location: root_path)
  end

  def unwatch
    @tracker = Tracker.find(params[:id])
    @tracker.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def season_params
      params.require(:season).permit(:season_no, :no_of_episodes, :start_date, :end_date)
    end
end
