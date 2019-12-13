require 'net/http'
require 'uri'

class LoadingController < ApplicationController
  def index
    @transaction_id = params[:transaction_id]
    @redirect_path = params[:redirect_path]
    render :index
  end

  def complete
    uri = URI(File.join(Rails.application.config.broker_domain, "#{params[:redirect_path]}"))
    redirect_to uri.to_s + "?transaction-id=#{params[:transaction_id]}"
  end
end
