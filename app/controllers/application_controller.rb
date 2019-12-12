class ApplicationController < ActionController::Base
  def hello
    render json: { epictetus: 'Know, first, who you are, and then adorn yourself accordingly.' }
  end
end
