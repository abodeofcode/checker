class AddDropDetailedAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :drop_detailed_address, :string
  end
end
