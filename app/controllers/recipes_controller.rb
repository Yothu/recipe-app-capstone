class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @current_user = current_user
  end

  def create
    recipe = current_user.recipes.new(recipe_params)
    if recipe.save
      redirect_to recipes_path
      flash[:success] = 'Recipe was created!'
    else
      redirect_to new_recipe_path
      flash[:error] = 'ERROR! Recipe was not created.'
    end
  end

  def destroy
    Recipe.find(params[:id]).delete
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
