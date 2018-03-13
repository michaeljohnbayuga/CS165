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
    @show = Show.new
  end

  def edit
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.valid?
      @show.save
      flash[:success_header] = @show.name + " has been created!"
      flash[:success_body] = "The show has been saved to the database."
      redirect_to show_path(@show)
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
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
