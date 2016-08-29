Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'users#new'
  get '/films' => 'films#index'
  get '/filmfestival' => 'films#index'

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :films, only: [:index, :create, :destroy, :update]
      end
    end
  end
end
