class HomeController < ApplicationController
  def show
    if !current_user.present?
      redirect_to '/shows'
    end

    @tracked = []
    @show_ids = []
    @upcoming = []
    # @dates = []

    @airing = 0
    @soon = 0

    if current_user.present?
      @tracked = Show.joins(seasons: {episodes: :trackers}).where(trackers: {user_id: current_user.id}).distinct.order(start_year: :asc, name: :asc)
      @week = Date.today.at_beginning_of_week..Date.today.at_end_of_week
      # @today = Episode.where(:air_date => Date.today.strftime("%Y-%m-%d"))
      @today = Episode.joins(season: :show).where(episodes: {air_date: Date.today.strftime("%Y-%m-%d")}).order("shows.start_year asc, shows.name asc, seasons.season_no asc, episodes.episode_no asc")

      @tracked.each do |show|
        @show_ids.append(show.id)
      end

      @week.map.each do |day|
        if day > Date.today
          # @dates.append(day.strftime("%Y-%m-%d"))
          # @eps = Episode.where(:air_date => day.strftime("%Y-%m-%d"))
          @eps = Episode.joins(season: :show).where(episodes: {air_date: day.strftime("%Y-%m-%d")}).order("shows.start_year asc, shows.name asc, seasons.season_no asc, episodes.episode_no asc")
          if @eps.exists?
            @eps.each do |ep|
              @upcoming.append(ep)
            end
          end
        end
      end

      @today.each do |episode|
        @season = Season.find(episode.season_id)
        if @show_ids.include?(@season.show_id)
          @airing = 1
        end
      end

      @upcoming.each do |episode|
        @season = Season.find(episode.season_id)
        if @show_ids.include?(@season.show_id)
          @soon = 1
        end
      end
    end
  end
end
