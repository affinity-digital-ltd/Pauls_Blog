class Article < ApplicationRecord
  has_many :comments, dependent: :delete_all

  validates :title, presence: true, length: { minimum: 3 }
  validates :author, presence: true
  validates :text, presence: true, length: { minimum: 10 } 
end

