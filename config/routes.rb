Rails.application.routes.draw do
  # get 'sessions/new'
  root 'home#index'
  get 'home/index'


get 'login' => 'sessions#new', :as => :login
post 'logout' => 'sessions#destroy', :as => :logout

   resources :users, only: [:new, :edit, :show, :create]
  #  resources :users, only: [:new, :edit, :show :create]

   resources :recipes do
     resources :reviews, only: [:new, :create, :edit]
   end
   resources :sessions

   resources :ingredients
  #  resources :ingredients, only: [:show]


   resources :ingredients_recipes
  # get 'users/index'
  #
  # get 'users/show'
  #
  # get 'users/new'
  #
  # get 'users/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
