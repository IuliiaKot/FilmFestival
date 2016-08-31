Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'users#new'
  get '/films' => 'films#index'
  get '/films/:id' => 'films#show'
  get '/filmfestival' => 'films#index'

  resources :users, only: [:new, :create]

  resources :reviews, only: [:new, :create]

  get '/sessions/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/sessions/logout' => 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :films, only: [:index, :show, :destroy, :update] do
        resources :reviews , only: [:new, :create, :index]
      end

      resources :categories, only: [:index, :show]
    end
  end

end
