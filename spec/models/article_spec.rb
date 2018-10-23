require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "Creating an article" do
    it "should queue a new article job" do
      expect { create(:article) }.to change(NewArticleEmailJob.jobs, :size).by(1)
    end
  end
end