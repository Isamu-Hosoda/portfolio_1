Rails.application.routes.draw do
  root "home#index"

  devise_for :users
  
  resources :users do
    collection do
      get 'search'
    end
  end

  resources :projects
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
