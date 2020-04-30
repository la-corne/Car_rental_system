class RentedCar < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :car, class_name: "Car"

  validates :rent_from_date, :rent_to_date, availability: true
  validate :end_date_after_start_date


  # def is_date_available(car_id)
  #   rents = RentedCar.where(car_id: car_id)
  #   logger.info "new car id: #{car_id}"
  #   logger.info "rents: #{rents.length}"
  #
  #   rents.each { |rent|
  #     if :rent_from_date >= rent.rent_from_date and :rent_to_date <= rent.rent_to_date
  #       errors.add("From #{:rent_from_date} to #{:rent_to_date} is not available")
  #       return FALSE
  #     elsif :rent_from_date >= rent.rent_from_date and :rent_from_date <= rent.rent_to_date
  #       errors.add("From #{:rent_from_date} to #{:rent_to_date} is not available")
  #       return FALSE
  #     elsif :rent_to_date >= rent.rent_from_date and :rent_to_date <= rent.rent_to_date
  #       errors.add("From #{:rent_from_date} to #{:rent_to_date} is not available")
  #       return FALSE
  #     end
  #   }
  #   return TRUE
  # end
  #

  def unavailable_dates
    rented_cars.pluck(:rent_from_date, :rent_to_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end


  private

  def end_date_after_start_date
    if rent_to_date < rent_from_date
      errors.add(:rent_to_date, "must be after the start date")
    end
  end

end
