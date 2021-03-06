Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/thomas', to: "pages#thomas" # temporary playground for DEVELOPMENT only !!!
  get 'users/:id/bookings', to: 'bookings#index', as: 'user_bookings'
  get 'bookings/:id', to: 'bookings#show', as: 'booking'
  delete 'bookings/:id', to: 'bookings#destroy', as: 'delete_booking'

  resources :vans do
    resources :bookings, except: [:index, :show, :destroy]
    resources :reviews, only: :create
  end
end
