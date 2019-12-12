require 'net/http'
require 'uri'

class LoadingController < ApplicationController
  def index
    @transaction_id = params[:transaction_id]
    render :index
  end

  def complete
    uri = URI(File.join(Rails.application.config.broker_domain, 'authorizeFormPost', 'response'))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if Rails.env.production?
    request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
    request.body = { transaction_id: params[:transaction_id] }.to_json
    http.request(request)
  end
end
