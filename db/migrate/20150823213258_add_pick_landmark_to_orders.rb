class AddPickLandmarkToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pick_landmark, :string
  end
end
