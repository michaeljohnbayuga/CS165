class ShowsController < ApplicationController
  def index
    @shows = Show.all.order(start_year: :desc, name: :asc)
    @codes = params[:codes]
    # @code = Show.find(params[:id])
  end

  def show
    @show = Show.find(params[:id])
    @seasons = @show.seasons.order(season_no: :asc)
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

  private
    def show_params
      params.require(:show).permit(:code, :name, :network, :start_year, :end_year)
    end
end
