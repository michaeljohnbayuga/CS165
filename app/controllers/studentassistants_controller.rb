class StudentassistantsController < ApplicationController
  before_action :set_dormer

  def create
    if Studentassistant.create(id: @dormer.id, student_number: @dormer.student_number,name: @dormer.name)
	   Dormer.where(student_number: @dormer.student_number).update(:is_sa => "t")
       flash[:success_header] = @dormer.name + " is now a Student Assistant"
       redirect_to @dormer
    end

  end
  
  def destroy
	if Studentassistant.find(params[:id]).destroy
       Dormer.where(student_number: @dormer.student_number).update(:is_sa => "f")
       flash[:error_header] = @dormer.name + " is no longer a Student Assistant"
       redirect_to @dormer
    end   
  end


  private
  
  def set_dormer
    @dormer = Dormer.find(params[:dormer_id]||params[:id])
  end

end
