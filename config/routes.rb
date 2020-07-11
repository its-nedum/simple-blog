Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # index page
  root "posts#index"

  # posts resources
  resources :posts
end
