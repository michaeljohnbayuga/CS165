class DormersController < ApplicationController
  def index
    @dormers = Dormer.all.order(sex: :asc, room_number: :asc, name: :asc)
    @codes = params[:codes]
    
    if $isSearched == 1
      if $isFiltered == 0 # IF NOT FILTERED
        @dormers = Dormer.all.order(sex: :asc, room_number: :asc, name: :asc)
      end
      if $isFiltered == 1 # IF FILTERED
        @dormers = Dormer.all.order(sex: :asc, room_number: :asc, name: :asc)
      end
    end
end

#viewing a dormer
  def show
    @show = Dormer.find(params[:id])
    @violation = Violation.find(params[:id])
    if session[:user_id]
      user_id = session[:user_id]
      dormer_id = params[:id]

    end

  end

  def new
    @dormer = Dormer.new
  end

  def create
    @dormer = Dormer.new(dormer_params)
    if @dormer.valid?
      if Dormer.exists?(:student_number => @dormer.student_number) 
          flash[:error_header] = "Student Number already exists"
          redirect_to '/dormers/new'
      else
          Violation.create(id: @dormer.id, student_number: @dormer.student_number, admin_name: current_user.name)
          @dormer.save
          flash[:success_header] = @dormer.name + " has been created!"
          flash[:success_body] = "The dormer has been saved to the database."
          redirect_to dormer_path(@dormer)
      end
    else
      render 'new'
    end
  end

  def edit
    @dormer = Dormer.find(params[:id])
  end

  def update
    @dormer = Dormer.find(params[:id])
    if @dormer.update(dormer_params)
      Studentassistant.where(id: @dormer.id).update(:student_number => @dormer.student_number,:name => @dormer.name)
      flash[:success_header] = @dormer.name + " has been updated!"
      flash[:success_body] = "The changes have been saved to the database."
      redirect_to @dormer
    else
      render 'edit'
    end
  end

  def destroy
    @dormer = Dormer.find(params[:id])
    @dormer.destroy
    @violation =  Violation.find(params[:id])
    @violation.destroy
    if Studentassistant.exists?(:id => params[:id])
       @studentassistant = Studentassistant.find(params[:id])
       @studentassistant.destroy
    end
    flash[:success_header] = @dormer.name + " has been deleted."
    flash[:success_body] = "The changes have been saved to the database."
    redirect_to '/dormers'
  end

  private
    def dormer_params
      params.require(:dormer).permit(:student_number, :name, :room_number, :sex, :course_year, :attachment)
    end
end
