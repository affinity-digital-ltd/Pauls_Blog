require 'rails_helper'
# Mock out the service and check it has been called with json hash
RSpec.describe MessageMailerServiceJob do
  describe "Message mailer worker", sidekiq: :inline do
    before do
      allow(MessageMailerService).to receive(:call)
    end

    let(:message) { build(:message).to_json }
    
    it "should call with a json hash" do
      MessageMailerServiceJob.perform_async(message)
      expect(MessageMailerService).to have_received(:call).with(message)
    end
  end
end