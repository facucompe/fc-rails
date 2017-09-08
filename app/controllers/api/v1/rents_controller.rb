module Api
  module V1
    class RentsController < ApiController
      skip_before_action :current_user, :authenticate_request
      
      def create
        rent = Rent.new(rent_params)
        if rent.save
          byebug
          RentMailer.rent_notification(rent).deliver_later  
          render json: rent, status: :created
        else
          render json: { errors: rent.errors }, status: :bad_request
        end
      end

      def index
        render json: Rent.where(user_id: params[:user_id]), status: :ok
      end

      def rent_params
        params.require(:rent).permit(:book_id, :user_id, :from, :to)
      end
    end
  end
end
