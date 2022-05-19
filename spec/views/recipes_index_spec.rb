require 'rails_helper'

RSpec.describe 'Recipe', type: :system do
  describe 'Index' do
    before(:each) do
      @u1 = User.new(name: 'user1', password: '111111', email: 'u@u')
      @u2 = User.new(name: 'user2', password: '123123', email: 'u@i')

      @u1.save
      @u2.save

      @r1 = @u1.recipes.new(name: 'recipe1', preparation_time: 10, cooking_time: 5,
                            description: 'This is the desc of recipe 1', public: true)

      @r2 = @u1.recipes.new(name: 'recipe2', preparation_time: 20, cooking_time: 10,
                            description: 'This is the desc of recipe 2', public: false)

      @r1.save
      @r2.save

      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '111111'
      click_button 'Log in'
      click_link 'My Recipes'
    end

    it 'shoud show the recipe page' do
      expect(page.current_path).to have_content('/recipes')
    end

    it 'should show the name of all my recipes' do
      expect(page).to have_content('recipe1')
      expect(page).to have_content('recipe2')
    end

    it 'should show the description of all my recipes' do
      expect(page).to have_content('This is the desc of recipe 1')
      expect(page).to have_content('This is the desc of recipe 2')
    end

    it 'should redirect to public recipes page when press a button' do
      click_link 'Public Recipes'
      expect(page.current_path).to have_content('/public_recipes')
    end

    it 'should redirect to foods page when press a button' do
      click_link 'My Foods'
      expect(page.current_path).to have_content('/foods')
    end

    it 'should redirect to add recipe page when press a button' do
      click_link 'Create Recipe'
      expect(page.current_path).to have_content('/recipes/new')
    end

    it 'should redirect to the recipe details page when clicking teh name of a recipe' do
      id = @r1.id
      click_link 'recipe1'
      expect(page.current_path).to have_content("/recipes/#{id}")
    end
  end
end
