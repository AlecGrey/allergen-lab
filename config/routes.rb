Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :allergies
  # resources :dish_ingredients

  # ~~ DISH ROUTES ~~ #
  post '/sorted', to: 'dishes#sort', as: 'sort'
  get 'dishes/:id/add_ingredient', to: 'dishes#add_getter', as: 'add_ingredient'
  post 'dishes/:id/add_ingredient', to: 'dishes#add_poster', as: 'post_ingredient'
  resources :dishes

  # ~~ ETC ~~ # 
  resources :ingredients
  resources :users
end
