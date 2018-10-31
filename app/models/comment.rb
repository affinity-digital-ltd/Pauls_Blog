class Comment < ApplicationRecord
  validates :body, :author_name, presence: true
  belongs_to :article
end
