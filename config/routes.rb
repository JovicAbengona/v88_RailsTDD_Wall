Rails.application.routes.draw do
  get 'users/index'
  get '/register' => 'users#register'
  get '/login' => 'users#login'
  get '/logout' => 'users#logout'

  get '/messages' => 'messages#index'

  post '/login' => 'users#user_login'
  post '/messages' => 'messages#post_message'
  post '/comments/:id' => 'comments#post_comment'

  root 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
