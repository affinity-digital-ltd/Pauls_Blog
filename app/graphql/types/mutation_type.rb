module Types
  class MutationType < Types::BaseObject
    field :newComment, CommentType, null: true do
      description "Adding a new comment to an article"
      argument :author_name, String, required: true
      argument :body, String, required: true
      argument :article_id, String, required: true
      argument :image, String, required: true
      argument :created_at, String, required: true
      argument :id, ID, required: true
    end

    def new_comment(author_name:, body:, image:, article_id:, created_at:, id:)
      
      article = Article.friendly.find(article_id)
      article.comments.create(author_name: author_name, body: body, image: image, created_at: created_at, id: id)
    end
  end
end
