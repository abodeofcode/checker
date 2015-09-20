class ChangeMobilenumberFormatInOrder < ActiveRecord::Migration
  def change
  	change_column :orders, :mobilenumber, :string
  end
end
