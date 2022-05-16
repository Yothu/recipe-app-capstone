class Food < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, foreign_key: 'food_id', class_name: 'RecipeFood', dependent: :delete_all

  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :measurement_unit, presence: true
end
