require 'rails_helper'

RSpec.describe PaulsBlogSchema do
  describe "returning article data" do
    let(:result) {
      res = PaulsBlogSchema.execute(
        query_string,
      )

      if res["errors"]
        pp res
      end
      res
    }

    let!(:article) { create(:article) }

    let(:query_string) { 
      %|
      mutation newComment {
        newComment(
          slug: "#{article.slug}",
          authorName: "Paul",
          body: "Some body text",
          image: "https://pbs.twimg.com/profile_images/993907963067760641/jQyC8fSM_normal.jpg"
        ) {
          authorName
          body
          image
        }
      }
    | 
  }

    it "should return a new comment with data" do
      article_data = result["data"]["newComment"]["article"]
      comment = result["data"]["newComment"]

      expect(comment.fetch("authorName")).to eq("Paul")
      expect(comment.fetch("body")).to eq("Some body text")
      expect(comment.fetch("image")).to eq("https://pbs.twimg.com/profile_images/993907963067760641/jQyC8fSM_normal.jpg")
    end
  end
end
