require 'rails_helper'

RSpec.feature 'Deleting Article' do
  before do
    @article = Article.create(title: "Test article one", body: "content for test article one")
  end

  scenario 'A user delete an article' do
    visit root_path
    click_link @article.title
    click_link 'Delete Article'

    expect(page).to have_content('Article has been deleted')
    expect(page.current_path).to eq(articles_path)
  end
end