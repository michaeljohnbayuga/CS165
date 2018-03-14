class SeasonsController < ApplicationController
  def create
    @show = Show.find(params[:show_id])
    @season = Season.new(season_params)
    @season.show_id = @show.id
    if @season.valid?
      @season.save
      flash[:success_header] = "Success!"
      flash[:success_body] = "The season has been saved to the database."
      redirect_to show_path(@show)
    else
      render 'new'
    end
  end

  def new
    @season = Season.new
    @show = Show.find(params[:show_id])

    @controller = "seasons"
    @action = "create"
  end

  def show
    @season = Season.find(params[:id])
    @show = Show.find(@season.show_id)
    @seasons = @show.seasons.order(season_no: :asc)
    @episodes = @season.episodes.order(episode_no: :asc, showep_no: :asc)
  end

  def edit
    @season = Season.find(params[:id])
    @show = Show.find(@season.show_id)
    @controller = "seasons"
    @action = "update"
  end

  def update
    @season = Season.find(params[:id])
    @show = Show.find(@season.show_id)


    if @season.update(season_params)
      flash[:success_header] = "Season " + @season.season_no.to_s + " of " + @show.name + " has been updated!"
      flash[:success_body] = "The changes have been saved to the database."
      redirect_to @show
    else
      render 'edit'
    end
  end

  def destroy
    @season = Season.find(params[:id])
    @show = Show.find(@season.show_id)
    @season.destroy

    flash[:success_header] = "Season " + @season.season_no.to_s + " of " + @show.name + " has been deleted."
    flash[:success_body] = "The changes have been saved to the database."
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
