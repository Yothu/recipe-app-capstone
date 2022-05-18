require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before do
    User.create(id: 1, name: 'name', email: 'name@name.com',
                password: 'password')
  end

  describe 'Visiting the login page' do
    before :each do
      visit '/users/sign_in'
    end

    it 'should have email input field' do
      expect(page).to have_text('Email')
    end

    it 'should have password input field' do
      expect(page).to have_text('Password')
    end

    it 'should have a log in button' do
      expect(page).to have_button('Log in')
    end

    it 'Should display an error message if user does not fill in the username or password' do
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'Should display an error message if username or password are filled with wrong data' do
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'aaaa'
      click_button 'Log in'
      expect(page).to have_text('Invalid Email or password.')
    end

    it 'Should log in successfully' do
      fill_in 'Email', with: 'name@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end
end
