class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time, null: false, default: 0
      t.integer :cooking_time, null: false, default: 0
      t.text :description
      t.boolean :public
      t.integer :user_id

      t.timestamps
    end
  end
end
