class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text #Using this currently. But please add a extra migration
      t.string :status
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
