Rails.application.routes.draw do
  root 'application#hello'

  get '/authentication', to: 'authentication#index'

  get '/mfa', to: 'mfa#index'

  get '/consent', to: 'consent#index'

  get '/approve', to: 'loading#index'

  get '/complete/:transaction_id', to: 'loading#complete', as: 'complete'

  # This endpoint might be redundant now as we are sending the credentials back as JWTs
  get '/issue/:type', to: 'credentials#issue'

  get '/issue/jwt/:type', to: 'credentials#issue_jwt'

  post '/verify', to: 'credentials#verify'
end
