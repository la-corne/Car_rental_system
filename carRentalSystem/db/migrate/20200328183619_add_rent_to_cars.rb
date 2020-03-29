class AddRentToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :rent, :float
  end
end
