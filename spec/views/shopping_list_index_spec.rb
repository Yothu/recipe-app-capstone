require 'rails_helper'

RSpec.describe 'Shopping List', type: :system do
  describe 'Index' do
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

      @f1 = Food.create(id: 3111, user_id: 1111, name: 'apples', measurement_unit: 'kilos', price: 1)
      Food.create(id: 3112, user_id: 1111, name: 'sugar', measurement_unit: 'grams', price: 2)

      RecipeFood.create(quantity: 1, food_id: 3111, recipe_id: 2111)
      RecipeFood.create(quantity: 2, food_id: 3111, recipe_id: 2112)
      RecipeFood.create(quantity: 2, food_id: 3112, recipe_id: 2111)
      RecipeFood.create(quantity: 1, food_id: 3112, recipe_id: 2112)

      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '111111'
      click_button 'Log in'
      click_link 'My Recipes'
      click_link 'recipe1'
      click_link 'Generate shopping list'
    end

    it 'should be in the shopping list page' do
      expect(page.current_path).to have_content('/shopping_list')
    end

    it 'should show 2 as the ammount of food to buy' do
      expect(page).to have_content('Amount of food items to buy: 2')
    end

    it 'should show $9 as the value of food needed' do
      expect(page).to have_content('Total value of food needed: $9')
    end

    it 'should show 6 grams for sugar' do
      expect(page).to have_content('3 grams')
    end

    it 'should show $3 for apples' do
      expect(page).to have_content('$3')
    end

    it 'should show $6 for sugar' do
      expect(page).to have_content('$6')
    end

    it 'should show 3 kilos for apples' do
      expect(page).to have_content('3 kilos')
    end

    it 'should show the sugar and apples' do
      expect(page).to have_content('apples')
      expect(page).to have_content('sugar')
    end
  end
end
