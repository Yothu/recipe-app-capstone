class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true).includes(:user, :recipe_foods, recipe_foods: [:food])
  end
end
