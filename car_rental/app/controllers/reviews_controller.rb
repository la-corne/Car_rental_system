class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_car

  # GET /reviews
  # GET /reviews.json
  def index
    #@reviews = Review.all
    # logger.info "Car id = #{@car.id}"
    @reviews = Review.where(car_id: @car.id).order("created_at DESC")
  end

  # GET /reviews/1
  # GET /reviews/1.json


  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.car_id = @car.id

    if @review.save
      redirect_to car_reviews_path(@car)
    else
      render 'new'
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @car, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to car_reviews_path(@car), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

  def set_car
    @car = Car.find(params[:car_id])
  end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit( :rank, :content)
    end
end
