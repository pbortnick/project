Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :posts
  end
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  get '/posts/:id/body', to: 'posts#body'

end
