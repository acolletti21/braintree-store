Rails.application.routes.draw do
  get '/' => 'dogs#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/orders' => 'orders#new'
  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'

  get '/carted_dogs' =>'carted_dogs#index'
  post '/carted_dogs' => 'carted_dogs#create'
  delete '/carted_dogs/:id' => 'carted_dogs#destroy'

  get '/checkouts' => 'checkouts#new'
  post '/checkouts' => 'checkouts#create'
  get '/checkouts/:id' => 'checkouts#show'
end
