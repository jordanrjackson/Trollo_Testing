Rails.application.routes.draw do
  devise_for :users

  root "boards#index"

  resources :users do
    resources :boards
  end

  resources :boards do
    resources :lists
  end

  resources :lists do
    resources :tasks
  end
end