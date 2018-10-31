class Article < ApplicationRecord
  has_many :comments, dependent: :delete_all
  
  validates :title, presence: true, length: { minimum: 3 }
  validates :author, presence: true
  validates :text, presence: true, length: { minimum: 10 } 

  after_create :new_post_email

  scope :featured, -> { newest.first }
  scope :newest, -> { order(created_at: :desc) }

  private

  def new_post_email
    NewArticleEmailJob.perform_async
  end
end



