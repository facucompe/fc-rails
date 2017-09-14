class BookSuggestion < ApplicationRecord
  validates :editorial, :price, :author, :link, :title, presence: true
  belongs_to :user, optional: true
end
