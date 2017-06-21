Rails.application.routes.draw do

  resources :comments do
    resources :comments
  end

  root to: "home#home"
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :posts do
    resources :comments
  end
end
