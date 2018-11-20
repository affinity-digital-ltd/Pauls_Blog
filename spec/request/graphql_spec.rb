require 'rails_helper'

RSpec.describe PaulsBlogSchema do
  describe "returning article data"
  # You can override `context` or `variables` in
  # more specific scopes
  let(:context) { {} }
  let(:variables) { {} }
  # Call `result` to execute the query
  let(:result) {
    res = PaulsBlogSchema.execute(
      query_string,
      context: context,
      variables: variables
    )
    # Print any errors
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
  it "returns article and comment data" do
    article_data = result["data"]["article"]
    comment = result["data"]["article"]["comments"]

    expect(article_data["title"]).to eq(article.title)
    expect(article_data["createdAt"]).to eq(article.created_at.utc.to_s)
    expect(comment.last["body"]).to eq(article.comments.last.body)
    expect(comment.last["authorName"]).to eq(article.comments.last.author_name)
  end
end


  # describe "returning a list of articles in an array"
  #   # You can override `context` or `variables` in
  #   # more specific scopes
  #   let(:context) { {} }
  #   let(:variables) { {} }
  #   # Call `result` to execute the query
  #   let(:result) {
  #     res = PaulsBlogSchema.execute(
  #       query_string,
  #       context: context,
  #       variables: variables
  #     )
  #     # Print any errors
  #     if res["errors"]
  #       pp res
  #     end
  #     res
  #   }

  #   let!(:articles) { create_list(:article, 10) }

  #   let(:query_string) { 
  #     %|
  #       { 
  #         articles { 
  #           author
  #           comments {
  #             authorName 
  #           }
  #         } 
  #       }
  #     | 
  #   }
  #   it "returns article and comment data" do
  #     article_data = result["data"]["articles"]["comments"]
      
  #     # expect(articles_data.count).to eq 10
  #     expect(comment.last["author_name"]).to eq(article.comments.last.author_name)
  #   end
  # end



  # describe "a specific query" do
  #   # provide a query string for `result`
  #   let(:query_string) { %|{ user { name } }| }

  #     %|
  #       { 
  #         article(id: #{article.id}) { 
  #           title 
  #           createdAt
  #           user
  #           comments {
  #             body 
  #             authorName
  #           }
  #         } 
  #       }
  #     | 
  #   }

  #   context "when there's no current user" do
  #     it "is nil" do
  #       # calling `result` executes the query
  #       expect(result["data"]["user"]).to eq(nil)
  #     end
  #   end
  # end

#   describe "a specific query"
#   # You can override `context` or `variables` in
#   # more specific scopes
#   let(:context) { {} }
#   let(:variables) { {} }
#   # Call `result` to execute the query
#   let(:result) {
#     res = PaulsBlogSchema.execute(
#       query_string,
#       context: context,
#       variables: variables
#     )
#     # Print any errors
#     if res["errors"]
#       pp res
#     end
#     res
#   }

#   let!(:article) { create(:article, :with_comments) }

#   let(:query_string) { 
#     %|
#       { 
#         article(id: #{article.id}) { 
#           user
#         } 
#       }
#     | 
#   }
#   it "returns nil" do
#     article_data = result["data"]["article"]
#     comment = result["data"]["article"]["comments"]

#     expect(result["data"]["user"]).to eq(nil)
#   end
# end

  #   context "when there's a current user" do
  #     # override `context`
  #     let(:context) {
  #       { current_user: User.new(name: "ABC") }
  #     }
  #     it "shows the user's name" do
  #       user_name = result["data"]["viewer"]["name"]
  #       expect(user_name).to eq("ABC")
  #     end
  #   end
  # end
