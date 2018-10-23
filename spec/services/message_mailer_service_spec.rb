require 'rails_helper'

RSpec.describe MessageMailerService do
  describe "Message from hash" do
    # pass through a message JSON string of message
    let(:message) { build(:message).to_json }

    # check it queues a mailer
    it "should create a message instance from hash" do
      expect { MessageMailerService.call(message) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end