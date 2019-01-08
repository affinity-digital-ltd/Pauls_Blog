module Types
  class MutationType < Types::BaseObject
    field :newComment, CommentType, null: true do
      description "Adding a new comment to an article"
      argument :author_name, String, required: true
      argument :body, String, required: true
      argument :image, String, required: true
      argument :slug, String, required: true
    end

    def new_comment(slug:, author_name:, body:, image:)
      if context.fetch(:authorised)
        article = Article.friendly.find(slug)
        comment = article.comments.create(author_name: author_name, body: body, image: image)
      else
        GraphQL::ExecutionError.new("Please login")
      end
    end
  end
end
