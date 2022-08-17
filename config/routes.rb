Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :cats, only: %i[index destroy]
  resources :breeds, only: %i[index destroy]
  root "cats#index"
  
end
