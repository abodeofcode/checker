class AddDropLandmarkToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :drop_landmark, :string
  end
end
