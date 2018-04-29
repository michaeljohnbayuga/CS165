class HomeController < ApplicationController
  def show
    #if !current_user.present?
    #  redirect_to '/shows'
    #end

    @shows = Show.all.order(start_year: :desc, name: :asc)
    @codes = params[:codes]

    # filter search
    @filter = $filter
    @title = $title
    @network = $network
    @year = $year
    @result = $result
    
    if $isSearched == 1
      if $isFiltered == 0 # IF NOT FILTERED
        @shows = Show.where('name LIKE ? OR network LIKE ? OR start_year LIKE ?', "%#{@keywords}%", "%#{@keywords}%", "%#{@keywords}%")
      end
      if $isFiltered == 1 # IF FILTERED
        @shows = Show.where('name LIKE ? AND network LIKE ? AND start_year LIKE ?', "%#{@title}%", "%#{@network}%", "%#{@year}%")
      end
    end

    # filter search
    $isFiltered = 0
    $filter = nil
    $title = nil
    $network = nil
    $year = nil

  end

  def filter_search
    $filter = Array.new

    $title = params[:title_input]
    $network = params[:network_input] 
    $year = params[:year_input]

    if $title == "" and $network == "" and $year == "" then
      $result = ""
    else
      $result = "Search results for: " + $title + " " + $network + " " + $year
    end

    $filter.push($title)
    $filter.push($network)
    $filter.push($year)

    $isSearched = 1
    $isFiltered = 1
    redirect_back(fallback_location: root_path)
  end
end
