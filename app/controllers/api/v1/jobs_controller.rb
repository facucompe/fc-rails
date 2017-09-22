module Api
  module V1
    class JobsController < ApiController
      skip_before_action :current_user, :authenticate_request, only: %i[show]
      def show
        render json: Job.find(params[:id]), status: :ok
      end
    end
  end
end
