require 'rails_helper'

RSpec.feature 'Creating Article' do

  before do
    @muhammed = User.create!(
        email: "muhammed@uk.com",
        password: "password"
    )
    login_as(@muhammed)
  end

  scenario 'User create a new article' do
    visit root_path
    click_link 'New Article'
    fill_in 'Title', with: 'Creating a Blog'
    fill_in 'Body', with: 'Lorum Ipsum'
    click_button 'Create Article'

    expect(Article.last.user).to eq(@muhammed)
    expect(page).to have_content 'Article has been created'
    expect(page.current_path).to eq(articles_path)
    expect(page).to have_content("Created by: #{@muhammed.email}")
  end
end