Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show, :destroy, :create]

  post 'useremail', to: 'users#useremail'
  post 'authenticate', to: 'authentication#authenticate'
end
