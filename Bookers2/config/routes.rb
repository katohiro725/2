Rails.application.routes.draw do



root 'top#index'
devise_for :users
get 'home/index'
get "home/about" => "home#index"
resources :users
resources :books


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
