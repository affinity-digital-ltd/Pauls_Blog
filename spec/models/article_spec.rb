require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "Creating an article" do
    
    it "should queue a new article email job" do
      expect { create(:article) }.to broadcast(:new_article_email)
    end
  end
end