require 'rails_helper'
include AuthHelper

RSpec.describe "static pages", type: :feature do

  describe "about page content" do

    it "should show content on about page" do
      visit(about_path)

      expect(page).to have_text 'About'
      expect(page).to have_text 'CV'
    end
  end

  describe "portfolio page content" do

    it "should show content on portfolio page" do
      visit(portfolio_path)

      expect(page).to have_text 'Portfolio'
    end
  end

  describe "contact page content" do

    it "should have content and links on contact page" do
      visit(contact_path)

      expect(page).to have_text 'Contact'
      expect(page).to have_link href: 'https://twitter.com/paulbrighton_'
      expect(page).to have_link href: 'https://www.facebook.com/paul.brighton.10'
      expect(page).to have_link href: 'https://www.pinterest.co.uk/paulbrightonfda/'
      expect(page).to have_link href: 'https://www.linkedin.com/in/paulbrighton/'
    end
  end

  context "filling in the contact form" do
    
    describe "with incorrect details" do
      it "should not send an email" do
        visit(contact_path) 
        
  
        fill_in("message[name]", with: nil)
        fill_in("message[email]", with: nil)
        fill_in("message[body]", with: nil)
        
        click_on("Send")
  
        expect(page).to have_content "Error sending the message. Please try again."
        expect(MessageMailerServiceJob).to_not have_enqueued_sidekiq_job  
      end
    end
  
    describe "with correct details" do

      it "should send an email" do
        visit(contact_path) 
  
        fill_in("message[name]", with: "name")
        fill_in("message[email]", with: "paul@paulbrighton.com")
        fill_in("message[body]", with: "A sample message.")
        
        click_on("Send")

        expect(page).to have_content "Your message has been sent, I will get back to you soon."
        expect(MessageMailerServiceJob).to have_enqueued_sidekiq_job("{\"name\":\"name\",\"email\":\"paul@paulbrighton.com\",\"body\":\"A sample message.\"}")
      end
    end
  end
end