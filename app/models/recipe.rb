class Recipe < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, foreign_key: 'recipe_id', class_name: 'RecipeFood', dependent: :delete_all

  validates :name, presence: true
  validates :preparation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 250 }

  def total_food_items
    recipe_foods.length
  end

  def total_price
    price = 0
    recipe_foods.each do |r|
      price += r.quantity * r.food.price
    end
    price
  end
end
