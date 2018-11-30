require 'rails_helper'

RSpec.describe NewCommentEmailListener do
  describe "A new_comment_email event" do
    it "should add comment email job to queue" do
      Wisper.subscribe(NewCommentEmailListener.new) do
        expect {
          create(:article, :with_comments)
        }.to change(NewCommentEmailJob.jobs, :size).by(3)
      end
    end
  end
end