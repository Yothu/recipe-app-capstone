class ShoppingListController < ApplicationController
  def index
    @foods = Food.select('foods.id, foods.name,foods.price,
      foods.measurement_unit, sum(recipe_foods.quantity) as quantity_sum').joins(:recipe_foods).group('foods.id')
    @total_value = 0
    @total_items = 0
    @foods.each do |f|
      # puts f.name, f.quantity_sum ,f.price, f.measurement_unit
      @total_value += f.price * f.quantity_sum
      @total_items += 1
    end
  end
end
