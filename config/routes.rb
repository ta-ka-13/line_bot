Rails.application.routes.draw do
  # resources :linebots
  # root 'linebots#index'
  resources :posts
  post '/callback' => 'linebot#callback'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
