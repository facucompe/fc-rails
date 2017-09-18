module Api
  module V1
    class BooksController < ApiController
      def index
        page = params[:page] || 1
        limit = params[:limit] || 20
        render json: Book.page(page).per(limit), status: :ok
      end

      def show
        render json: Book.find(params[:id]), status: :ok
      end
    end
  end
end
