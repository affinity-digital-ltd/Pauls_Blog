require 'rails_helper'
# Mock out the service and check it has been called with json hash
RSpec.describe MessageMailerServiceJob do
  let(:message) { build(:message).to_json }
  
  it "should call with a json hash" do
    MessageMailerServiceJob.perform_async(message)
    expect(MessageMailerServiceJob).to have_enqueued_sidekiq_job(message)
  end
end