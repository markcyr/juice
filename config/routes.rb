Rails.application.routes.draw do
  # get 'sessions/new'
   resources :users, only: [:new, :edit, :show]

   resources :recipes do
     resources :reviews, only[:new, :create, :edit]
   end

   resources :ingredients, only[:show]
   
   resources :ingredients_recipes, only[]
  # get 'users/index'
  #
  # get 'users/show'
  #
  # get 'users/new'
  #
  # get 'users/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
