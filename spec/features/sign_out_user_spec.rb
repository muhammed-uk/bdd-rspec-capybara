require 'rails_helper'

RSpec.feature 'User sign out' do
  before do
    @muhammed = User.create!(
        email: "muhammed@uk.com",
        password: "password"
    )

    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: @muhammed.email
    fill_in 'Password', with: @muhammed.password
    click_button 'Log in'
  end

  scenario do
    visit root_path

    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).not_to have_content('Sign out')
  end
end