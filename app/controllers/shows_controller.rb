class ShowsController < ApplicationController
  def index
    @shows = Show.all
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
  end

  def create
    @show = Show.new(show_params)

    @show.save
    redirect_to @show
  end

  def update
  end

  def destroy
  end

  private
    def show_params
      params.require(:show).permit(:code, :name, :network, :start_year, :end_year)
    end
end
