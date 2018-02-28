class SeasonsController < ApplicationController
  def create
    @season = Season.new(season_params)
    @season.save
  end

  private
    def season_params
      params.require(:season).permit(:season_no, :no_of_episodes, :start_date, :end_date)
    end
end
