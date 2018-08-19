require 'rails_helper'
include AuthHelper

RSpec.describe "Articles", type: :feature do
  before(:each) do
    visit admin_articles_path
    http_login
  end

  describe "listing articles" do
    it "should show the articles" do
      visit admin_articles_path
      
      expect(page).to have_css "h1", text: "List of all Articles"
    end
  end

  describe "adding an article" do
    context "with valid data" do
      it "should add the article" do
        visit admin_articles_path
        click_link('New Post')

        # Fill in form
        fill_in("Title", :with => "A Title")
        fill_in("Author", :with => "Paul")
        fill_in("Text", :with => "Some text...")
        # Submit form
        click_on("Save Article")

        # Check article has been added
        expect(page).to have_content "A Title"
      end
    end

    context "with invalid data" do
      it "should not add the article"
    end
  end

  describe "viewing an article" do
    # create article
    let!(:article) { create(:article) }

    it "should show the contents of the article" do
      http_login
      visit admin_article_path(article)
      
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.text)
      expect(page).to have_content(article.author)
    end
  end

  describe "editing an article" do
    it "should update the article"
  end

  describe "deleting an article", js: true do
    it "should delte the article"
  end
end