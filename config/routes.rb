Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'

  resources :users, constraints: { format: 'json' }
  resources :posts, constraints: { format: 'json' } do
    resources :comments
  end

  get '/signup' => 'users#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/api/v1/posts' => 'posts#create', :defaults => { :format => 'json' }
  get '/api/v1/posts/:id' => 'posts#show', :defaults => { :format => 'json' }
  get '/api/v1/posts' => 'posts#index', :defaults => { :format => 'json' }

  post 'api/v1/reports/by_author' => 'users#report', :defaults => { :format => 'json' }

end
