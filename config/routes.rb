Rails.application.routes.draw do
  resources :users do
    resources :likes
  end
  resources :likes
  resources :tweets
  resources :users do
    resources :tweets
  end
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  get 'user/:id', to: 'users#show', as: 'user_show'
end
