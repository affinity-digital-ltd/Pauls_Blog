require 'rails_helper'
include AuthHelper

RSpec.describe "Contact form", type: :feature do
  before(:each) do
    ActionMailer::Base.deliveries.clear
  end

  describe "contact form email error" do

    it "should not send an email" do
      visit(static_pages_contact_path) 
      

      fill_in("message[name]", with: nil)
      fill_in("message[email]", with: nil)
      fill_in("message[body]", with: nil)
      
      click_on("Send")

      expect(page).to have_content "Error sending the message. Please try again."
      expect(ActionMailer::Base.deliveries.size).to eq(0)
    end
  end

  describe "contact form email confirmation" do

    it "should send an email" do
      visit(static_pages_contact_path) 

      fill_in("message[name]", with: "name")
      fill_in("message[email]", with: "paul@paulbrighton.com")
      fill_in("message[body]", with: "A sample message.")
      
      click_on("Send")

      expect(page).to have_content "Your message has been sent, I will get back to you soon."
      expect(ActionMailer::Base.deliveries.size).to eq(1)
    end
  end
  
end