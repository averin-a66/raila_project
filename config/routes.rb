Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "recipes#index", as: 'home'
  # get 'new'=>'recipes#new'
  resources :recipes
  resources :systems
  resources :countries
  resources :enums
  resources :enum_converts
end
