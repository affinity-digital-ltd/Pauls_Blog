require 'rails_helper'
require 'support/factory_bot'
include AuthHelper


RSpec.describe "Article comments", type: :feature do
  include LoginUser

  describe "adding a comment" do
    before do
      log_in
    end

    let!(:article) { create(:article) }

    it "should add a user comment" do
      visit article_path(article)

      fill_in("comment[author_name]", with: "User name")
      fill_in("comment[body]", with: "A users comment")
      
      click_on("Post")

      expect(page).to have_content "User name"
      expect(page).to have_content "A users comment"
    end
  end

  describe "adding a comment with markdown" do
    before do
      log_in
    end

    let!(:article) { create(:article) }

    it "should add a markdown formatted comment" do
      visit article_path(article)

      fill_in("comment[author_name]", with: "User name")
      fill_in("comment[body]", with: "##### Hello")
      
      click_on("Post")

      expect(page).to have_content "User name"
      expect(page).to have_selector('h5', text: 'Hello')
    end
  end

  describe "adding a comment with incorrect details" do
    before do
      log_in
    end

    let!(:article) { create(:article) }

    it "should prompt the user to use the correct details" do
      visit article_path(article)

      fill_in("comment[author_name]", with: "")
      fill_in("comment[body]", with: "")
      
      click_on("Post")
      
      expect(page).to have_content "Author name can't be blank"
      expect(page).to have_content "Body can't be blank"
    end
  end

  describe "inaccessible comment form" do
    let!(:article) { create(:article) }

    it "should not let a user access comment form" do
      visit article_path(article)

      expect(page).to have_no_content("Logout")
      expect(page).to have_no_content("Add your comment here")
      
      expect(page).to have_content "Please login to comment."
      expect(page).to have_content "Login"
    end
  end

  describe "comment counter" do
    before do
      log_in
    end

    let(:count) { rand(10) }
    let!(:article) { create(:article, :with_comments, comments: count) }
    
    it "should add the number of comments to counter" do
      visit article_path(article)

      if count == 1
        expect(page).to have_content "#{article.comments.count} comment"
      else
        expect(page).to have_content "#{article.comments.count} comments"
      end
    end
  end
end