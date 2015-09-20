class AddPickDetailedAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pick_detailed_address, :string
  end
end
