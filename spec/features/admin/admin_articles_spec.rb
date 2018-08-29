require 'rails_helper'
include AuthHelper

RSpec.describe "Articles", type: :feature do
  before(:each) do
    http_login
  end

  describe "listing articles" do
    let!(:articles) { create_list(:article, 3) }

    it "should show all the articles" do
      visit admin_articles_path
      
      articles.each do |article|
        expect(page).to have_content article.title
      end
    end
  end

  describe "adding an article" do
    context "with valid data" do
      it "should add the article" do
        visit admin_articles_path
        click_link('New Post')

        fill_in("Title", with: "Another Title")
        fill_in("Author", with: "Paul")
        fill_in("Text", with: "Some text...")
        
        click_on("Create Article")

        expect(page).to have_content "Another Title"
      end
    end
  end
  
  describe "viewing an article" do
    # create article
    let!(:article) { create(:article) }

    it "should show the contents of the article" do
      visit article_path(article)
      
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.text)
      expect(page).to have_content(article.author)
    end
  end

  describe "editing an article" do
    let!(:article) { create(:article) }

    it "should update the contents of an article" do
      visit admin_articles_path

      click_link('Edit')
      fill_in("Author", with: "New Author")
      click_on "Update Article"

      expect(page).to have_content("New Author")
    end
  end

  describe "invalid data in article" do

    it "should not create an article with invalid inputs" do
      visit new_admin_article_path

      click_on("Create Article")

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Author can't be blank")
      expect(page).to have_content("Text can't be blank")
    end
  end

  describe "deleting an article", js: true do
    let!(:article) { create(:article) }

    it "should delete the article" do
      visit admin_articles_path

      click_link("Delete")

      page.driver.browser.switch_to.alert.accept 
      expect(page).to_not have_content article.title 
    end
  end
end