Rails.application.routes.draw do


  root 'welcome#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  get 'saved', to: 'users#my_saved'
  post 'save_car', to: 'users#add_cars_to_favourite'

#  post 'rent_car', to: 'users#add_cars_to_rent'

  get 'rented', to: 'users#my_rented'
  get 'rent_car', to: 'users#add_cars_to_rent'

  delete 'delete', to: 'rented_cars#admin_destroy'

  get 'search', to: 'cars#search'

  post 'rented_cars/new'


  # get 'rented', to: 'users#my_rented'

  resources :cars do
    resources :reviews
  end
  resources :rented_cars
  resources :users
  resources :saved_cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
