Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
get '/users/sign_out', to: 'users/sessions#destroy'
 root to: "devise/sessions#new"
end
resources   :foods, only: %i[index,create,new,destroy]
resources   :recipes, only: %i[index,show,create,new,destroy]




  # Defines the root path route ("/")


end
