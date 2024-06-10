Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
    resources :favorites, only: [:create]
  end

  resources :favorites, only: [:index, :destroy]

  resources :bookings, only: [:edit, :update, :destroy]

  resource :profile, only: :show

  resources :animals, except: [:index, :show] do
    resources :health_records, only: [:new, :create, :index]
    resources :documents, only: :index
    resources :bookings, only: :index
  end

  resources :health_records, only: [:edit, :update, :destroy]
end
