class AuthenticationController < ApplicationController
  def index
    if params['transaction-id'].nil?
      render json: { error: 'Missing transaction ID' }, status: :bad_request
    else
      @transaction_id = params['transaction-id']
      render :index
    end
  end
end
