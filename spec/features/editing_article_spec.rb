require 'rails_helper'

RSpec.feature 'Editing Article' do
  before do
    @article = Article.create(title: "Test article one", body: "content for test article one")
  end

  scenario 'A user update an article' do
    visit root_path
    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Title', with: 'Test Article 2'
    fill_in 'Body', with: 'Body for Article 2'
    click_button 'Update Article'

    expect(page).to have_content('Article has been updated')
    expect(page.current_path).to eq(article_path(@article))
    end

  scenario 'A user failed to update an article' do
    visit root_path
    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Body for Article 2'
    click_button 'Update Article'

    expect(page).to have_content('Article has not been updated')
    expect(page.current_path).to eq(article_path(@article))
  end
end