class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  validates :title, confirmation: true
end
