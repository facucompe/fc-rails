module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :current_user, :authenticate_request
      def create
        book_suggestion = BookSuggestion.new(suggestion_params)
        byebug
        render json: { hola: 'hola'}, status: :ok
      end
      def suggestion_params
        params.require(:book_suggestion).permit(:editorial, :title, :author, :link, :price)
      end
    end
  end
end
