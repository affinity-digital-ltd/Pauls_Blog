module Types
  class QueryType < Types::BaseObject
    field :article, ArticleType, null: true do
      description "Finds an article with an id"
      argument :id, ID, required: true
    end

    def article(id:)
      Article.find(id)
    end 

    field :articles, [Types::ArticleType], null: false do
      description "Returns an array of all articles"
    end
  
    def articles
      Article.all
    end
  end
end