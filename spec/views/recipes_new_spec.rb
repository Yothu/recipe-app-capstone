require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'New' do
    before(:each) do
      User.destroy_all
      Recipe.destroy_all

      User.create(id: 1111, name: 'user1', password: '111111', email: 'u@u')
      User.create(id: 1112, name: 'user2', password: '123123', email: 'u@i')

      @r1 = Recipe.create(id: 2111, user_id: 1111, name: 'recipe1', preparation_time: 10, cooking_time: 5,
                          description: 'This is the desc of recipe 1', public: true)

      Recipe.create(id: 2112, user_id: 1111, name: 'recipe2', preparation_time: 20, cooking_time: 10,
                    description: 'This is the desc of recipe 2', public: false)

      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '111111'
      click_button 'Log in'
      click_link 'My Recipes'
      click_link 'Create Recipe'
    end

    it 'should be in the add recipe page' do
      expect(page.current_path).to have_content('/recipes/new')
    end

    it 'should have a name label' do
      expect(page).to have_content('Name:')
    end

    it 'should have a preparation time label' do
      expect(page).to have_content('Preparation time:')
    end

    it 'should have a cooking time label' do
      expect(page).to have_content('Cooking time:')
    end

    it 'should have a public label' do
      expect(page).to have_content('Public Recipe!')
    end

    it 'should have a go back button' do
      expect(page).to have_link('Go back')
    end

    it 'should have a submt button' do
      expect(page).to have_button('Submit')
    end

    it 'should create a recipe' do
      fill_in 'Name', with: 'newRecipe'
      fill_in 'Preparation time', with: '1'
      fill_in 'Cooking time', with: '2'
      fill_in 'Description', with: 'desc'
      click_button 'Submit'

      expect(page).to have_content('newRecipe')
    end
  end
end
