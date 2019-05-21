Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/thomas', to: "pages#thomas" # temporary playground for DEVELOPMENT only !!!

  get 'vans/search', to: "vans#search"
  resources :vans do
    resources :bookings
  end
end
