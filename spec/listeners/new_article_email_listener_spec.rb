require 'rails_helper'

RSpec.describe NewArticleEmailListener do
  describe "A new_article_email event" do
    it "should add article email job to queue" do
      Wisper.subscribe(NewArticleEmailListener.new) do
        expect {
          create(:article)
        }.to change(NewArticleEmailJob.jobs, :size).by(1)
      end
    end
  end
end