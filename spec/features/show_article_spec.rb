require 'rails_helper'

RSpec.feature 'Showing an Article' do
  before do
    muhammed = User.create!(email: "muhammed@uk.com", password: "password")
    @article = muhammed.articles.create(title: "My Article", body: "Body of my article")
  end

  scenario "A user shows an article" do
    visit root_path
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end