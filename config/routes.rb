Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
  # end

  resources :tweets do
    resources :likes
  end
  resources :users, only: %i[show] do
    resources :tweets, only: %i[index create]
    resources :likes
    # resources :liked_tweets, only: %i[show]
  end

  namespace :api do
    resources :tweets, only: %i[index show create update destroy]
    resources :users, only: %i[index show create update destroy]
  end
end
