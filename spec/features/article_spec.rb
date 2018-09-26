require 'rails_helper'
include AuthHelper

RSpec.describe "articles and home page", type: :feature do

  describe "viewing an article" do
    let!(:article) { create(:article) }

    it "should show the contents of the article" do
      visit article_path(article)
      
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.author)
      expect(page).to have_content(article.created_at.strftime("%d-%m-%Y"))
      expect(page).to have_content(article.text)
    end
  end

  describe "viewing disqus comments", js: true do
    let!(:article) { create(:article) }

    it "should show the disqus comments" do
      visit article_path(article)

      within '#disqus_thread' do
        expect(page).to have_xpath '//iframe'
      end
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
