require 'rails_helper'

RSpec.describe 'Recipe Food', type: :system do
  describe 'New' do
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

      @f1 = Food.create(id: 3111, user_id: 1111, name: 'apple', measurement_unit: 'kilos', price: 1)
      Food.create(id: 3112, user_id: 1111, name: 'orange', measurement_unit: 'grams', price: 2)

      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '111111'
      click_button 'Log in'
      click_link 'My Recipes'
      click_link 'recipe1'
      click_link 'Add Ingredient!'
    end

    it 'should be in the add ingredient page' do
      expect(page.current_path).to have_content("/recipes/#{@r1.id}/recipe_foods/new")
    end

    it 'should show apple' do
      expect(page).to have_content('apple')
    end

    it 'should show orange' do
      expect(page).to have_content('orange')
    end

    it 'should show kilos for apple' do
      expect(page).to have_content('kilos')
    end

    it 'should show grams for orange' do
      expect(page).to have_content('grams')
    end
  end
end
