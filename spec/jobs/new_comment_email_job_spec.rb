require 'rails_helper'

RSpec.describe NewCommentEmailJob, type: :worker do
  describe "new comment notification email" do
    before do
      allow(NewCommentEmail).to receive(:call)
    end

    let!(:article) { create(:article) }

    it "should queue a worker when a comment is created" do
      Sidekiq::Testing.inline! do
        NewCommentEmailJob.perform_async(article.id)
      end
      expect(NewCommentEmail).to have_received(:call).with(article.id)
    end
  end
end