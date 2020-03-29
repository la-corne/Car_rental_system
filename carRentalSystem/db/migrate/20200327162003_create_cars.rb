class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.boolean :aircondition
      t.decimal :price
      t.boolean :automatic
      t.string :model
      t.integer :production_year
      t.string :engine
      t.text :description

      t.timestamps
    end
  end
end
