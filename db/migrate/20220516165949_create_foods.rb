class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :price, null: false, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
