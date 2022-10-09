Rails.application.routes.draw do
  root "home#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :products do
    resources :websites, only: :show
  end

  resources :results, only: :create
end
