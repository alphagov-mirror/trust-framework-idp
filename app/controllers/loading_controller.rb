class LoadingController < ApplicationController
  def index
    @transaction_id = params[:transaction_id]
    render :index
  end

  def complete
    render json: { hello: params[:transaction_id] }
  end
end
