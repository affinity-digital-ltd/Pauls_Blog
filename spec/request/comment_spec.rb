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
          newComment(slug: "#{article.slug}", body: "Another comment.", authorName: "Paul", image: "https://pbs.twimg.com/profile_images/993907963067760641/jQyC8fSM_normal.jpg") { 
            article {
              title 
              comments {
                authorName
                body
                image
              }
            }
          } 
        }
      | 
    }

    it "should return a new comment with data" do
      article_data = result["data"]["newComment"]["article"]
      comments = result["data"]["newComment"]["article"]["comments"]

      expect(comments.first["body"]).to eq("Another comment.")
      expect(comments.first["authorName"]).to eq("Paul")
      expect(comments.first["image"]).to eq("https://pbs.twimg.com/profile_images/993907963067760641/jQyC8fSM_normal.jpg")
    end
  end
end
