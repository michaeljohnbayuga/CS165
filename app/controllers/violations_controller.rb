class ViolationsController < ApplicationController
  before_action :set_dormer

  def create
    if Violation.exists?(:id => @dormer.id)
       @violation=Violation.find(@dormer.id)
       @violation.increment!(:minor)

       if @violation.minor >= 3
          @violation.increment!(:major)
          @violation.update(:minor => 0)
       end       
       redirect_to @dormer
     end

  end
  
  def destroy
	if Violation.find(params[:id]).destroy
       flash[:error_header] = @dormer.name + " is no longer a Student Assistant"
       redirect_to @dormer
    end   
  end


  private
  
  def set_dormer
    @dormer = Dormer.find(params[:dormer_id]||params[:id])
  end

end
