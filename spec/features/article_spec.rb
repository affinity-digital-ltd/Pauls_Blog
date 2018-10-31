require 'rails_helper'
include AuthHelper

RSpec.describe "articles and home page", type: :feature do

  describe "viewing an article" do
    let!(:article) { create(:article) }

    it "should show the contents of the article" do
      visit article_path(article)
      
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.author)
      expect(page).to have_content(article.created_at.strftime("%b %e %Y"))
      expect(page).to have_content(article.text)
    end
  end

  describe "home page content" do
    let!(:article) { create(:article) }

    it "should show content on home page" do
      visit root_path

      expect(page).to have_text 'Paul Brighton Web Development'
      expect(page).to have_content(article.title)
    end
  end
end
