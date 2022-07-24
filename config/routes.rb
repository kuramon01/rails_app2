Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # get 'users/show'
  # get 'users/profile' => "users#edit"
  root 'top#index'
  resources :users
  resources :rooms
  resources :reservations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'result' => 'rooms#result'
  get 'search' => 'rooms#search'
  # Defines the root path route ("/")
  # root "articles#index"
end
