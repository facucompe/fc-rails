module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :current_user, :authenticate_request, only: [:create]
      def create
        book_suggestion = BookSuggestion.new(suggestion_params)
        # book_suggestion.user_id = current_user.id
        if book_suggestion.save
          render json: book_suggestion, status: :created
        else
          render json: { errors: book_suggestion.errors }, status: :bad_request
        end
      end

      private

      def suggestion_params
        params.require(:book_suggestion).permit(:editorial, :title, :author, :link, :price)
      end
    end
  end
end
