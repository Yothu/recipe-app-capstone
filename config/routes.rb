Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'users/sessions#destroy'
    root to: "devise/sessions#new"
  end

  resources   :foods, only: %i[index,create,new,destroy]
  resources   :recipes, only: %i[index,show,create,new,destroy]
end
