class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :lat_lng

      t.timestamps null: false
    end
  end
end
