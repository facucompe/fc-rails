class BookSuggestionsController < ApplicationController
  def new
    @new_book_suggestion = BookSuggestion.new
    @book_suggestions = BookSuggestion.all
  end
end
