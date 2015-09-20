class AddDropLiftToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :drop_lift, :string
  end
end
