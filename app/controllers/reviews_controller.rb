class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.where("show_id = ?", params[:id])
    @review = Review.new
    @shows = Show.all.order(start_year: :desc, name: :asc)
    @users = User.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    session[:return_to] ||= request.referer
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new
    @review.user_id = current_user.id
    @review.show_id = params[:id]
    @review.text = params[:review][:text]
    @review.save
    redirect_back(fallback_location: root_path)
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      redirect_to session.delete(:return_to)
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:text)
    end
end
