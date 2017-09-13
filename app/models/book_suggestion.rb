class BookSuggestion < ApplicationRecord
  validates :editorial, :price, :author, :link, presence: true
  belongs_to :user, optional: true
end
