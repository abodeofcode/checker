class CreatePromocodes < ActiveRecord::Migration
  def change
    create_table :promocodes do |t|
      t.string :codetext
      t.integer :timesused
      t.integer :discount_value
      t.boolean :validity

      t.timestamps null: false
    end
  end
end
