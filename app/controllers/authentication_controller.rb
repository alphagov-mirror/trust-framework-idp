class AuthenticationController < ApplicationController
  def index
    if params['transaction-id'].nil?
      render json: { error: 'Missing transaction ID' }, status: :bad_request
    else
      @transaction_id = params['transaction-id']
      @redirect_path = params['redirect-path']
      render :index
    end
  end

  def password
    if params['transaction_id'].nil?
      render json: { error: 'Missing transaction ID' }, status: :bad_request
    else
      @transaction_id = params['transaction_id']
      @redirect_path = params['redirect_path']
      render :password
    end
  end
end
