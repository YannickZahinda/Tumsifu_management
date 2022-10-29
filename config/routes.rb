Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'enseigants', to: 'enseignants#index'
  root "home#index"
  resources :home, only: %i[:index] do
   resources :enseignants, only: %i[:index, :create, :destroy, :show]
  end 
end
