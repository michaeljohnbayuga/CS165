class ShowsController < ApplicationController
  def index
    @shows = Show.all.order(start_year: :desc, name: :asc)
    @codes = params[:codes]
  end

  def show
    @show = Show.find(params[:id])
    @seasons = @show.seasons.order(season_no: :asc)
    @favorited = Favorite.find_by(user: current_user, show: @show).present?
  end

  def new
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

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])

    if @show.update(show_params)
      flash[:success_header] = @show.name + " has been updated!"
      flash[:success_body] = "The changes have been saved to the database."
      redirect_to @show
    else
      render 'edit'
    end
  end

  def destroy
    @show = Show.find(params[:id])
    @show.destroy

    flash[:success_header] = @show.name + " has been deleted."
    flash[:success_body] = "The changes have been saved to the database."
    redirect_to '/shows'
  end

  private
    def show_params
      params.require(:show).permit(:code, :name, :network, :start_year, :end_year)
    end
    def season_params
      params.require(:season).permit(:season_no, :no_of_episodes, :start_date, :end_date)
    end
end
