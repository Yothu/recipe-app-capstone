class RecipeFood < ActiveRecord::Base
  belongs_to :food, class_name: 'Food'
  belongs_to :recipe, class_name: 'Recipe'

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
