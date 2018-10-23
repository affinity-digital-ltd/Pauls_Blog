require 'rails_helper'

RSpec.describe NewArticleEmailJob, type: :worker do
  describe "sending a campaign email", sidekiq: :inline do
    before do
      allow(NewArticleEmail).to receive(:call)
    end

    it "should queue a worker when an article is created" do
      NewArticleEmailJob.perform_async
      expect(NewArticleEmail).to have_received(:call)
    end
  end
end