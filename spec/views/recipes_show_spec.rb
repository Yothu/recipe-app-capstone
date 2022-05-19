require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'Show' do
    before(:each) do
      User.destroy_all
      Recipe.destroy_all
      Food.destroy_all
      RecipeFood.destroy_all

      User.create(id: 1111, name: 'user1', password: '111111', email: 'u@u')
      User.create(id: 1112, name: 'user2', password: '123123', email: 'u@i')

      @r1 = Recipe.create(id: 2111, user_id: 1111, name: 'recipe1', preparation_time: 10, cooking_time: 5,
                          description: 'This is the desc of recipe 1', public: true)

      Recipe.create(id: 2112, user_id: 1111, name: 'recipe2', preparation_time: 20, cooking_time: 10,
                    description: 'This is the desc of recipe 2', public: false)

      @f1 = Food.create(id: 3111, user_id: 1111, name: 'food1', measurement_unit: 'kilos', price: 1)
      Food.create(id: 3112, user_id: 1112, name: 'food2', measurement_unit: 'grams', price: 2)

      RecipeFood.create(quantity: 4, food_id: 3111, recipe_id: 2111)

      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '111111'
      click_button 'Log in'
      click_link 'My Recipes'
      click_link 'recipe1'
    end

    it 'should be in the recipe details page' do
      id = @r1.id
      expect(page.current_path).to have_content("/recipes/#{id}")
    end

    it 'should show the name of the recipe' do
      expect(page).to have_content('recipe1')
    end

    it 'should show the description of the recipe' do
      expect(page).to have_content('This is the desc of recipe 1')
    end

    it 'should show the preparation time of the recipe' do
      p_time = @r1.preparation_time
      expect(page).to have_content("Preparation time: #{p_time}")
    end

    it 'should show the cooking time of the recipe' do
      c_time = @r1.cooking_time
      expect(page).to have_content("Cooking time: #{c_time}")
    end

    it 'should redirect to shopping list page when press a button' do
      click_link 'Generate shopping list'
      expect(page.current_path).to have_content('/shopping_list')
    end

    it 'should redirect to add ingredients page when press a button' do
      click_link 'Add Ingredient!'
      expect(page.current_path).to have_content("/recipes/#{@r1.id}/recipe_foods/new")
    end

    it 'should show the name of the food in the recipe' do
      expect(page).to have_content('food1')
    end
  end
end
