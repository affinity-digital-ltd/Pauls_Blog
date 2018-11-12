class Comment < ApplicationRecord
  validates :body, :author_name, presence: true
  belongs_to :article
  has_one_attached :image

  after_create :comment_email

  private

  def comment_email
    NewCommentEmailJob.perform_async(self.article.id)
  end
end
