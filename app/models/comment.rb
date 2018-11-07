class Comment < ApplicationRecord
  validates :body, :author_name, presence: true
  belongs_to :article
  has_one_attached :image
end
