class RentedCarsController < ApplicationController
  #before_action :set_rented_car, only: [:show, :edit, :update]

  # GET /rented_cars
  # GET /rented_cars.json
  def index
    @rented_cars = RentedCar.all
  end

  # GET /rented_cars/1
  # GET /rented_cars/1.json
  def show
  end

  # GET /rented_cars/new
  def new
    # means that the current user is the one who will make the rent
    @rented_car = RentedCar.new
    $car = Car.find(params[:car_id])


    # logger.info "ddd =: #{@rented_car.car_id }"
    #logger.info "mmm =: #{$car.id }"
    # logger.info "user id =: #{@rented_car.user_id}"
    #logger.info "card no =: #{@rented_car.credit_card_no}"
    # logger.info "expired date =: #{@rented_car.car_id }"
    # logger.info "rent from date =: #{@rented_car.car_id }"
    # logger.info "rent to date =: #{@rented_car.car_id }"

  end

  # GET /rented_cars/1/edit
  def edit
  end

  # POST /rented_cars
  # POST /rented_cars.json
  def create
    @rented_car = RentedCar.new(rented_car_params)
    @rented_car.car_id = $car.id
    @rented_car.user_id = current_user.id
    @car = Car.find($car.id)

    if @rented_car.save
      redirect_to @car
    else
      render 'new'
    end
  end

  # PATCH/PUT /rented_cars/1
  # PATCH/PUT /rented_cars/1.json
  def update
    respond_to do |format|
      if @rented_car.update(rented_car_params)
        format.html { redirect_to @rented_car, notice: 'Rented car was successfully updated.' }
        format.json { render :show, status: :ok, location: @rented_car }
      else
        format.html { render :edit }
        format.json { render json: @rented_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rented_cars/1
  # DELETE /rented_cars/1.json
  def destroy
    @rented_car = current_user.rented_cars.where(car_id: params[:id]).first
    @rented_car.destroy
    # respond_to do |format|
    #   format.html { redirect_to rented_cars_url, notice: 'Rented car was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    redirect_back(fallback_location: '/')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_rented_car
    #   @rented_car = RentedCar.where("car_id = ? AND user_id = ?",params[:id] ,current_user.id)
    #   #@rented_car = current_user.rented_cars.where(car_id: params[:car_id]).first
    #   logger.info "user id =: #{@rented_car.user_id}"
    #   logger.info "car id =: #{@rented_car.car_id}"
    # end


    # Only allow a list of trusted parameters through.
    def rented_car_params
      #params.fetch(:rented_car, {})
      params.require(:rented_car).permit(:credit_card_no, :cvc, :credit_expired_date, :rent_from_date, :rent_to_date)
    end
end
