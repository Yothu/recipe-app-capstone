class RecipeFoodsController < ApplicationController
  def destroy
    puts params.inspect
    RecipeFood.find(params[:id]).destroy
    redirect_to recipe_path(Recipe.find(params[:recipe_id]))
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    redirect_to recipe_path(@recipe) unless @recipe.user == current_user
    @recipe_food = RecipeFood.new

    @foods = Food.all
  end

  def create
    recipe_food = RecipeFood.new(recipe_food_params)
    recipe_food.food_id = params[:food_id]
    recipe_food.recipe_id = params[:recipe_id]

    if recipe_food.save
      redirect_to recipe_path(id: params[:recipe_id])
      flash[:success] = 'Ingredient was added!'
    else
      redirect_to new_recipe_recipe_food_path
      flash[:error] = 'ERROR! Ingredient was not added.'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
