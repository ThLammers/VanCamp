Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'users/:id/bookings', to: 'bookings#index', as: 'user_bookings'
  get 'bookings/:id', to: 'bookings#show', as: 'booking'
  delete 'bookings/:id', to: 'bookings#destroy', as: 'delete_booking'

  get 'vans/search', to: "vans#search"
  resources :vans do
    resources :bookings, except: [:index, :show, :destroy]
  end
end
