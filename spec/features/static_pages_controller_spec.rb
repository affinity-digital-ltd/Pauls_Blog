require 'rails_helper'
include AuthHelper

RSpec.describe "static pages", type: :feature do

  describe "about page content" do

    it "should show content on about page" do
      visit(static_pages_about_path)

      expect(page).to have_text 'About'
      expect(page).to have_text 'CV'
    end
  end

  describe "portfolio page content" do

    it "should show content on portfolio page" do
      visit(static_pages_portfolio_path)

      expect(page).to have_text 'Portfolio'
    end
  end

  describe "contact page content" do

    it "should have content and links on contact page" do
      visit(static_pages_contact_path)

      expect(page).to have_text 'Contact'
      expect(page).to have_link href: 'https://twitter.com/paulbrighton_'
      expect(page).to have_link href: 'https://www.facebook.com/paul.brighton.10'
      expect(page).to have_link href: 'https://www.pinterest.co.uk/paulbrightonfda/'
      expect(page).to have_link href: 'https://www.linkedin.com/in/paulbrighton/'
    end
  end
  
end