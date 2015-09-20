class AddPickFloorToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pick_floor, :string
  end
end
