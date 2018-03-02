class HomeController < ApplicationController
  def show
    if !current_user.present?
      redirect_to '/shows'
    end
    @today = Episode.where(:air_date => Date.today.strftime("%Y-%m-%d"))

    @upcoming = []
    @dates = []
    @week = Date.today.at_beginning_of_week..Date.today.at_end_of_week

    @week.map.each do |day|
      if day > Date.today
        @dates.append(day.strftime("%Y-%m-%d"))
        @eps = Episode.where(:air_date => day.strftime("%Y-%m-%d"))
        if @eps.exists?
          @eps.each do |ep|
            @upcoming.append(ep)
          end
        end
      end
    end

  end
end
