module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :article, ArticleType, null: true do
      description "Find article with an id"
      argument :id, ID, required: true
    end

    # Not working yet
    field :articles, ArticleType, null: true do
      description"Find all articles with an id"
      argument :id, ID, required: true
    end

    def article(id:)
      Article.find(id)
    end 
  end
end