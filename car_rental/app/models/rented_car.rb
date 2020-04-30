class RentedCar < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :car, class_name: "Car"
end
