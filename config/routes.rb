Rails.application.routes.draw do
  resources :products
  resources :criteria_definitions
  resources :routes, only: [:index] do
    collection do
      match "search", action: :search, via: [:get, :post]
    end
  end
end
