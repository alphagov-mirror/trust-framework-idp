require 'net/http'
require 'uri'

class LoadingController < ApplicationController
  def index
    @transaction_id = params[:transaction_id]
    render :index
  end

  def complete
    uri = URI(File.join(Rails.application.config.broker_domain, 'authorizeFormPost', 'response'))
    redirect_to uri.to_s + "?transaction-id=#{params[:transaction_id]}"
  end
end
