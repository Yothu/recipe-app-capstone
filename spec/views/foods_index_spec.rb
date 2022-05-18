require 'rails_helper'

RSpec.describe 'Food index page', type: :system do
  before do
    User.create(id: 1, name: 'other', email: 'other@name.com', password: 'password')

    Food.create(id: 1, user_id: 1, name: 'lettuce', measurement_unit: 'kg', price: 20)
  end

  describe 'Visiting the food index page' do
    before :each do
      visit '/foods'
      fill_in 'Email', with: 'other@name.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it "should display the foods's name" do
      expect(page).to have_text('lettuce')
    end

    it "should display the food's measurement_unit" do
      expect(page).to have_text('kg')
    end

    it 'should have an add food button' do
      expect(page).to have_button('Add food')
    end
  end
end
