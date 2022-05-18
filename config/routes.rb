Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root "foods#index"
    get '/users/sign_out', to: 'users/sessions#destroy'
  end

  resources :foods, only: %i[index create new destroy]
  resources :recipes do
    resources :recipe_foods, only: %i[create new destroy]
  end
  resources :public_recipes, only: %i[index]
  resources :shopping_list, only: %i[index]

end
