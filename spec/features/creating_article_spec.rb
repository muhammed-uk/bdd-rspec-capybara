require 'rails_helper'

RSpec.feature 'Creating Article' do
  scenario 'User create a new article' do
    visit root_path
    click_link 'New Article'
    fill_in 'Title', with: 'Creating a Blog'
    fill_in 'Body', with: 'Lorum Ipsum'
    click_button 'Create Article'

    expect(page).to have_content 'Article has been created'
    expect(page.current_path).to eq(articles_path)
  end
end