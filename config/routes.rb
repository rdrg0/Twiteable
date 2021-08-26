Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :likes
  resources :tweets
  resources :users do
    resources :tweets
  end
end
