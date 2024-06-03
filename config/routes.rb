Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update, :destroy]

  resource :profile, only: :show

  resources :animals, except: [:index, :show] do
    resources :health_record, only: [:new, :create, :index]
    resources :documents, only: :index
    resources :bookings, only: :index
  end

  resources :health_record, only: [:edit, :update, :destroy]
end
