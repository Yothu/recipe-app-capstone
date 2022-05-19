require 'rails_helper'

RSpec.describe 'Add fodd page', type: :feature do
  before do
    User.create(id: 1, name: 'name', email: 'name@name.com',
                password: 'password')
  end

  describe 'Visiting the add food page' do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit '/foods/new'
    end

    it 'should have name input field' do
      expect(page).to have_text('Name')
    end

    it 'should have measurement unit  input field' do
      expect(page).to have_text('Measurement Unit')
    end
    it 'should have price input field' do
      expect(page).to have_text('Price')
    end

    it 'should have a add button' do
      expect(page).to have_button('Add')
    end

    it 'Should add successfully' do
      fill_in 'Name', with: 'apple'
      fill_in 'Measurement Unit', with: 'kilos'
      fill_in 'Price', with: 1
      click_button 'Add'
      expect(page).to have_content('Food added')
    end
  end
end
