class BookSuggestionSerializer < ActiveModel::Serializer
  attributes :editorial, :price, :title, :author, :publisher, :year, :link, :user
  belongs_to :user
end
