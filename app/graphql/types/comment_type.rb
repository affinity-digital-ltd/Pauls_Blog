module Types
  class CommentType < GraphQL::Schema::Object
    description "A comment"
    field :id, ID, null: false
    field :author_name, String, null: false
    field :body, String, null: false
    field :created_at, String, null: false
    field :image, String, null: false
  end
end