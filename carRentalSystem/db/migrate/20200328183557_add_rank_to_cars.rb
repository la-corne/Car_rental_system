class AddRankToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :rank, :float
  end
end
