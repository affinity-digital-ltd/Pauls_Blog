require 'rails_helper'
include AuthHelper

RSpec.describe "Article comments", type: :feature do
  describe "comments form" do
    let!(:article) { create(:article) }

    it "should show user comment form on page" do
      visit article_path(article)

      expect(page).to have_content "Name"
      expect(page).to have_content "Comment"
      expect(page).to have_content "Post"
    end
  end

  describe "adding a comment" do
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

  describe "comment counter" do
    let!(:article) { create(:article) }

    it "should add two comments to counter" do
      visit article_path(article)

      fill_in("comment[author_name]", with: "User name")
      fill_in("comment[body]", with: "A users comment")
      
      click_on("Post")

      expect(page).to have_content "1 comment"

      fill_in("comment[author_name]", with: "Another name")
      fill_in("comment[body]", with: "Another user comment")
      
      click_on("Post")

      expect(page).to have_content "2 comments"
    end
  end
end