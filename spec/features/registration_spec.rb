require 'rails_helper'



  feature 'Users' do

    scenario 'user creates user profile' do
      visit sign_up_path
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testpass'
      click_on 'sign up'
      expect(page).to have_content("Current user is: test@test.com")
    end
  end
