module Api
  module V1
    class RentsController < ApiController
      def create
        rent = Rent.new(rent_params)
        authorize rent
        if rent.save
          RentMailer.rent_notification(rent).deliver_later
          render json: rent, status: :created
        else
          render json: { errors: rent.errors }, status: :bad_request
        end
      end

      def index
        page = params[:page] || 1
        limit = params[:limit] || 20
        rents = Rent.where(user_id: params[:user_id]).page(page).per(limit)
        authorize rents
        render json: rents, status: :ok
      end

      private

      def rent_params
        params.require(:rent).permit(:book_id, :user_id, :from, :to)
      end
    end
  end
end
