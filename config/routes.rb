Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    collection do
      get 'search'
    end
    resources :messages, only: [:index, :create]
    resources :orders, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
