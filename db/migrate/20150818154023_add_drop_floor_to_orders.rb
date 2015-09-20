class AddDropFloorToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :drop_floor, :string
  end
end
