class Comment < ApplicationRecord
  validates :body, :author_name, presence: true
  belongs_to :article

  after_create :comment_email

  private

  def comment_email
    NewCommentEmailJob.perform_async(self.article.id)
  end
end
