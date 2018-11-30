require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Creating comments on an article" do
    let(:article) { create(:article) }

    it 'should queue a new comment email job' do
      expect { create(:comment, article: article) }.to broadcast(:new_comment_email)
    end
  end
end