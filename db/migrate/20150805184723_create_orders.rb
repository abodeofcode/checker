class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :pickup
      t.string :drop
      t.datetime :pick_time
      t.string :vehicletype
      t.integer :mobilenumber
      t.string :items
      t.integer :labour
      t.string :couponused
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
