Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'

  resources :users do
    resources :categories do
      resources :operations
    end
  end
end
