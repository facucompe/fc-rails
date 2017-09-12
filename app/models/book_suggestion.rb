class BookSuggestion < ApplicationRecord
  validates :editorial, :price, :author, :link, :publisher, presence: true
  belongs_to :user, optional: true
end
