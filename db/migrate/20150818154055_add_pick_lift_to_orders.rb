class AddPickLiftToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pick_lift, :string
  end
end
