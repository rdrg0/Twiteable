Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
  # end

  resources :users do
    resources :likes
  end
  resources :tweets do
    resources :likes
  end
  resources :users, only: %i[show] do
    resources :tweets, only: %i[index]
    resources :liked_tweets, only: %i[show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  # get 'user/:id', to: 'users#show', as: 'user_show'
end
