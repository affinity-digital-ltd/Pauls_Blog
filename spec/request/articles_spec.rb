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
        { 
          article(slug: "#{article.slug}") { 
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

    it "should return article" do
      article_data = result["data"]["article"]

      expect(article_data["title"]).to eq(article.title)
      expect(article_data["createdAt"]).to eq(article.created_at.utc.to_s)
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
