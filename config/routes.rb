Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cats#index"
  resources :cats, :breeds, only: %i[index destroy]
  
end
