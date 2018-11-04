require 'rails_helper'
require 'support/factory_bot'
include AuthHelper

RSpec.describe "Article comments", type: :feature do
  before do
    page.set_rack_session(userinfo: { "info" => { "name" => "Paul"}})
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

  describe "adding a comment" do
    let!(:article) { create(:article) }

    it "should add a user comment" do
      visit article_path(article)

      fill_in("comment[author_name]", with: "")
      fill_in("comment[body]", with: "")
      
      click_on("Post")
      
      expect(page).to have_content "Author name can't be blank"
      expect(page).to have_content "Body can't be blank"
    end
  end

  describe "comment counter" do
    let(:count) { rand(10) }
    let!(:article) { create(:article, :with_comments, comments: count) }
    
    it "should add three comments to counter" do
      visit article_path(article)

      if count == 1
        expect(page).to have_content "#{article.comments.count} comment"
      else
        expect(page).to have_content "#{article.comments.count} comments"
      end
    end
  end
end