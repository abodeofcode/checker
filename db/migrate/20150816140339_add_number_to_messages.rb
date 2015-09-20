class AddNumberToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :phonenumber, :string
  end
end
