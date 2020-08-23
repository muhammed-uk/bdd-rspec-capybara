require 'rails_helper'

RSpec.feature 'User signin' do
  before do
    @muhammed = User.create!(
        email: "muhammed@uk.com",
        password: "password"
    )
  end

  scenario 'With valid credentials' do
    visit root_path

    click_link 'Sign in'

    fill_in 'Email', with: @muhammed.email
    fill_in 'Password', with: @muhammed.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content("Signed in as #{@muhammed.email}")
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')

  end
end