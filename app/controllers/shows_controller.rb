class ShowsController < ApplicationController
  def index
    @shows = Show.all.order(start_year: :desc, name: :asc)
    @codes = params[:codes]
    # @code = Show.find(params[:id])
  end

  def show
    @show = Show.find(params[:id])
    @seasons = @show.seasons
  end

  def new
  end

  def edit
    @show = Show.find(params[:id])
  end

  def create
    @show = Show.new(show_params)

    @show.save
    redirect_to @show
  end

  def update
    @show = Show.find(params[:id])

    if @show.update(show_params)
      redirect_to @show
    else
      render 'edit'
    end
  end

  def destroy
    @show = Show.find(params[:id])
    redirect_to '/shows'
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
    def show_params
      params.require(:show).permit(:code, :name, :network, :start_year, :end_year)
    end
end
