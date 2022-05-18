Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'users/sessions#destroy'
  end

  # resources :users
  resources :foods, only: %i[index create new destroy]
  resources :recipes, only: %i[index show create new destroy] do
    resources :recipe_foods, only: %i[create new destroy]
  end
  resources :public_recipes, only: %i[index]
  resources :shopping_list, only: %i[index]

  root "foods#index"
end
