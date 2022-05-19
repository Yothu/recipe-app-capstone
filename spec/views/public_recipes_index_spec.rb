require 'rails_helper'

RSpec.describe 'Food index page', type: :system do
  before do
    User.create(id: 1, name: 'other', email: 'other@name.com', password: 'password')

    Food.create(id: 1, user_id: 1, name: 'lettuce', measurement_unit: 'kg', price: 20)

    Recipe.create(id: 1, user_id: 1, name: 'meatballs', preparation_time: 10, cooking_time: 20,
                  description: 'meat in ball shape', public: true)
  end

  describe 'Visiting the food index page' do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'other@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Public Recipes'
    end
    it 'should go to public recipes page' do
      expect(page.current_path).to have_content('/public_recipes')
    end

    it 'should display a link' do
      expect(page).to have_link('meatballs')
    end
    it 'should display the Total food items text' do
      expect(page).to have_text('Total food items')
    end
  end
end
