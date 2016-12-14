Rails.application.routes.draw do

  # root 'users#index'
  # get '/users' => 'users#index'
  # get 'sessions/new'
  # get '/users/:id' => 'users#show'
  # post '/users' => 'sessions#create'

  # get 'users/index'



	root to: 'users#index'
	get '/users' => 'users#index'
	get '/users/new' => 'users#new'
	get '/users/:id' => 'users#show'  
	get '/users/:id/edit' => 'users#edit'
	get '/sessions' => 'sessions#create'
	get '/sessions/' => 'sessions#new'
	post '/sessions' => 'sessions#create'
	post '/users/new' => 'users#create'
	patch '/users/:id' => 'users#update'
	delete '/users/:id' => 'users#destroy'
	delete '/sessions' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
