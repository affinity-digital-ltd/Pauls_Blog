require 'rails_helper'

RSpec.describe NewCommentEmail do
  describe "comment notification email" do
    let(:article) { create(:article) }

    it "should send a comment notification email" do
      expect { NewCommentEmail.call(article.id) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end