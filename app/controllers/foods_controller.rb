class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
    @current_user = current_user
  end

  def new
    @food = Food.new
  end

  def create
    food = Food.new(food_params.merge(user_id: current_user.id))
    if food.valid?
      food.save
      flash[:notice] = 'Food added'
    else
      flash[:notice] = 'Could not add food'
    end
    redirect_to foods_path
  end

  def destroy
    Food.find(params[:id]).destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
