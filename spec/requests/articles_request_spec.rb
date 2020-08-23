require 'rails_helper'

RSpec.describe "Articles", type: :request do

  before do
    muhammed = User.create!(email: "muhammed@uk.com", password: "password")
    @article = muhammed.articles.create(title: "1st Article", body: "Content for 1st article")
  end

  describe 'GET /articles/:id' do
    context 'with existing article' do
      before { get article_path(@article) }
      it 'handles existing article' do
        expect(response.status).to eq(200)
      end
    end
    context 'with non-existing article' do
      before { get '/articles/xxx' }
      it 'handles non-existing article' do
        expect(response.status).to eq(302)
        flash_message = "The article you are looking for could not be found"
        expect(flash[:alert]).to eq(flash_message)
      end
    end
  end

end
