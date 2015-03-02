require 'rails_helper'



  feature 'Users' do

    scenario 'user creates user profile' do
      visit sign_up_path
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testpass'
      click_on 'sign up'
      expect(page).to have_content("Current user is: test@test.com")
    end

    scenario 'user signs in' do
      User.create!(email: 'test@test.com', password: 'testpass')
      visit sign_in_path
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testpass'
      click_on 'sign in'
      expect(page).to have_content("Current user is: test@test.com")
    end

    scenario 'user signs out' do
      User.create!(email: 'test@test.com', password: 'testpass')
      visit root_path
      click_on 'sign me in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testpass'
      click_on 'sign in'
      click_on 'sign me out!'
      expect(page).to have_content('nobody is hur!')
    end
  end
