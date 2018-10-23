require 'rails_helper'

RSpec.describe MessageMailer, type: :mailer do
  describe "sending a message email" do
    let(:message) { build(:message) }
    let(:mail) { MessageMailer.with(message: message).contact }

    it "should render the headers" do
      expect(mail.subject).to eq("A new message from #{message.name}")
      expect(mail.to).to eq(["paul@paulbrighton.com"])
      expect(mail.from).to eq(["paul@paulbrighton.com"])
    end

    it "should render the body" do
      expect(mail.body.encoded).to have_content(message.body)
      expect(mail.body.encoded).to have_content(message.email)
    end
  end
end