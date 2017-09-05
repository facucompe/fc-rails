module Api
  module V1
    class BooksController < ApiController
      
      def index
        render json: Book.all, status: :ok
      end

      def show
        render json: Book.find(params[:id]), status: :ok
      end

    end
  end
end
