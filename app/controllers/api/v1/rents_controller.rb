module Api
  module V1
    class RentsController < ApiController
      def create
        rent = params.require(:rent).permit(:book_id, :user_id, :from, :to)
        r = Rent.new(rent)
        r.save
      end

      def index
        render json: Rent.where(user_id: params[:user_id]), status: :ok
      end
    end
  end
end
