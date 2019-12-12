Rails.application.routes.draw do
  root 'application#hello'

  get '/authentication/:transaction_id', to: 'authentication#index'

  get '/mfa', to: 'mfa#index'

  get '/consent', to: 'consent#index'

  get '/approve', to: 'loading#index'
end
