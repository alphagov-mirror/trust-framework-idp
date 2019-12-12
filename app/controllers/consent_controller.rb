class ConsentController < ApplicationController
  def index
    if params[:transaction_id].nil?
      render json: { error: 'Missing transaction ID' }, status: :bad_request
    else
      @transaction_id = params[:transaction_id]
      render :index
    end
  end
end
