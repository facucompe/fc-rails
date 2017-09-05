module Api
  module V1
    class BooksController < ApiController
      # skip_before_action :current_user, :authenticate_request
      def index
        render json: Book.all, status: :ok
      end
      def show
        render json: Book.find(params[:id]), status: :ok
      end
    end
  end
end