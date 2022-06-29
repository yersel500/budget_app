Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get 'users', to: 'devise/sessions#new'
  end
  devise_for :users
  root to: 'categories#index'

  resources :users do
    resources :categories do
      resources :operations
    end
  end
end
