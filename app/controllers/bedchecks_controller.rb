class BedchecksController < ApplicationController
  def index
    @bedchecks = Dormer.joins("INNER JOIN bedchecks ON bedchecks.student_number=dormers.student_number").all.order(student_number: :asc)
	@studentassistants= Studentassistant.all.order(sex: :asc, name: :asc)
    @dormers = Dormer.all.order(sex: :asc, room_number: :asc, name: :asc)
    @codes = params[:codes]

  end

#viewing a bedcheck
  def show
    @bedcheck = Bedcheck.find(params[:id])
    @bedcheck.destroy
    redirect_to '/bedchecks'
    if session[:user_id]
      user_id = session[:user_id]
      bedcheck_id = params[:student_number]

    end

  end

  def new
    @bedcheck = Bedcheck.new
  end

  def create
    @bedcheck = Bedcheck.new(bedcheck_params)
    d=DateTime.now
    if @bedcheck.valid?
       if Bedcheck.exists?(:student_number => @bedcheck.student_number)
          flash[:error_header] = "Already exists in the endorsement"
          redirect_to "/bedchecks/new"
       else
          if Dormer.exists?(:student_number =>@bedcheck.student_number)
             @bedcheck.save
             Dormer.where('student_number =?',@bedcheck.student_number).update(:bedcheck_id => @bedcheck.id)
             @bedcheck.update(:date => d.strftime("%d/%m/%Y"))
             flash[:success_header] = "Saved in endorsement"
             redirect_to "/bedchecks/new"
          else
             flash[:error_header] = "Student Number does not exists"
             redirect_to "/bedchecks/new"
          end
       end
    else
      render 'new'
    end
  end

  def destroy
    @bedcheck = Bedcheck.find(params[:id])
    @bedcheck.destroy
    redirect_to '/bedchecks'
  end

  private
    def bedcheck_params
      params.require(:bedcheck).permit(:student_number, :sa_name, :guard_name, :date)
    end

end
