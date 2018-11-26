class HomeController < ApplicationController
  def dormer
    @codes = params[:codes]
    # filter search
    @filter = $filter
    @title = $title
    @result = $result
    d=DateTime.now
	if $isSearched == 1
	@timers=Dailyreport.where('student_number=?',@title) 
      if $isFiltered == 0 # IF NOT FILTERED
        @dormers = Dormer.where('?', "%#{@result}%")
      end
      if $isFiltered == 1 # IF FILTERED
        if Dormer.exists?(:student_number => @title)
           @dormers = Dormer.where('student_number = ?', @title) 
		   Dormer.where(student_number: @title).update(:created_at => d.strftime("%d/%m/%Y %H:%M")) 
           if Dormer.exists?(:student_number=>@title,:status => "in")
              Dormer.where(student_number: @title).update(:status => "out")
              Dailyreport.create(:student_number =>@title,:status => "out", :created_at => d.strftime("%d/%m/%Y %H:%M"))
           else
              Dormer.where(student_number: @title).update(:status => "in")
              Dailyreport.create(:student_number =>@title,:status => "in", :created_at => d.strftime("%d/%m/%Y %H:%M"))
           end
  
        else     
            flash[:error_header] = "Student Number does not exists"
            flash[:error_body]="Try Again!"
		    redirect_back(fallback_location: root_path)
        end
   
      
	  end
    end

    # filter search
    $isFiltered = 0
    $filter = nil
    $title = nil

  end  
  def filter_search
    $filter = Array.new

    $title = params[:title_input]

    if $title == "" then
      $result ="Try Again"
	  $title="Try Again"
	  $isFiltered = 0
    else
      $result = $title
	  $isFiltered=1
    end

    $filter.push($title)

    $isSearched = 1
    redirect_back(fallback_location: root_path)

  end
end
