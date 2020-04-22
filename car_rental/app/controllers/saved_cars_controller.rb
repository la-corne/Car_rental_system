class SavedCarsController < ApplicationController
  def destroy
      @saved_car = current_user.saved_cars.where(savedcar_id: params[:id]).first
      @saved_car.destroy
      redirect_to saved_path
  end

end
