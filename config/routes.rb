Rails.application.routes.draw do
  resources :users do
    resources :categories do
      resources :operations
    end
  end
end
