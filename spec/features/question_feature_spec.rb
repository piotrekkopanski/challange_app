require 'rails_helper'
RSpec.feature "question", :type => :feature do
  it 'shows index question page ' do
       visit '/questions'
       page.should have_content "New Question"
    end
  it 'registration user' do
      visit '/questions/'
      click_on 'Sign up'
      fill_in 'user[email]', with: 'sampleemail@wp.pl'
      fill_in 'user[password]', with: '12345678'
      fill_in 'user[password_confirmation]', with: "12345678"
      fill_in 'user[name]', with: 'Example-Name'
      click_button 'Sign up' 
      page.should have_content 'You have signed up successfully'
    end
 
end
