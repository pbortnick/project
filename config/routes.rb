Rails.application.routes.draw do
  resources :categories do
    resources :posts
  end
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'categories#index'
  get '/posts/:id/body', to: 'posts#body'

end
