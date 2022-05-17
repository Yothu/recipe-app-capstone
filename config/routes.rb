Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'users/sessions#destroy'
  end

  resources :foods, only: %i[index create new destroy]
  resources :recipes, only: %i[index show create new destroy ]
  resources :public_recipes, only: %i[index]



  root "foods#index"
end
