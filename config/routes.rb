Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'users#new'
  get '/films' => 'films#index'
  get '/filmfestival' => 'films#index'

  post '/users' => 'users#create'

  namespace :api do
    namespace :v1 do
      resources :films, only: [:index, :show, :destroy, :update]
      resources :categories, only: [:index, :show]
    end
  end

end
