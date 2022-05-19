class AddFoodRecipeRefToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :recipe_foods, :foods, column: :food_id, on_delete: :cascade
    add_foreign_key :recipe_foods, :recipes, column: :recipe_id, on_delete: :cascade
  end
end
