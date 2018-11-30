class Comment < ApplicationRecord
  include Wisper::Publisher

  validates :body, :author_name, presence: true
  belongs_to :article

  after_create :comment_email

  private

  def comment_email
    broadcast(:new_comment_email, self.article.id)
  end
end
