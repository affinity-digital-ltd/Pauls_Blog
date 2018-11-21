require 'rails_helper'

RSpec.describe PaulsBlogSchema do
  describe "returning article data" do
    let(:result) {
      res = PaulsBlogSchema.execute(
        query_string
      )

      if res["errors"]
        pp res
      end
      res
    }

    let!(:article) { create(:article, :with_comments) }

    let(:query_string) { 
      %|
        { 
          article(id: #{article.id}) { 
            title 
            createdAt
            comments {
              body 
              authorName
            }
          } 
        }
      | 
    }

    it "should return article and comment data" do
      article_data = result["data"]["article"]
      comment = result["data"]["article"]["comments"]

      expect(article_data["title"]).to eq(article.title)
      expect(article_data["createdAt"]).to eq(article.created_at.utc.to_s)
      expect(comment.last["body"]).to eq(article.comments.last.body)
      expect(comment.last["authorName"]).to eq(article.comments.last.author_name)
    end
  end

  describe "getting a list of articles in an array" do
    let(:result) {
      res = PaulsBlogSchema.execute(
        query_string,
      )

      if res["errors"]
        pp res
      end
      res
    }

    let!(:article) { create_list(:article, 10) }

    let(:query_string) { 
      %|
        { 
          articles { 
            title 
            author
          } 
        }
      | 
    }
    
    it "should return all articles" do
      article_data = result["data"]["article"]

      expect(article.count).to eq 10
      expect(article.first["title"]).to eq(article.first.title)
      expect(article.last["author"]).to eq(article.last.author)
    end
  end
end
