Rails.application.routes.draw do
    #resources :diaries
  get 'google_authentication/new'

  get 'password_resets/new'

  get 'password_resets/edit'

    root "static_pages#home"
    get	 'suspended'        => 'food_locker#suspended'
    get '/configure',     to: 'google_authentication#new'
    post '/configure',    to: 'google_authentication#create'
    delete '/configure',  to: 'google_authentication#destroy'
    get '/help',          to: 'static_pages#help'
    get '/about',         to: 'static_pages#about'
    #get '/quiz',          to: 'quizzes#new'
    get '/contact',       to: 'static_pages#contact'
    get '/signup',        to: 'users#new'
    get    '/login',      to: 'sessions#new'
    post   '/login',      to: 'sessions#create'
    delete '/logout',     to: 'sessions#destroy'
    get '/verification',  to: 'verifications#new'
    post '/verification', to: 'verifications#create'
    #get '/insert_email',  to: 'verifications#email'
    #post '/insert_email', to: 'verifications#create_email'
    get '/map', to: 'static_pages#map'
    #post '/quiz',   to: 'quiz#create'
    get    'suspend'        => 'sites#suspend'
    get	 'specialoptions'   => 'food_locker#specialoptions'
    put    'sites'         	=> 'sites#suspend'
    post '/specialoptions'  =>  'food_locker#suspended'
    get    'ban'     => 'users#ban'
    put    'users'   => 'users#ban'
    get    'promote' => 'users#promote'
    put    'users'   => 'users#promote'
    post  '/quizzes/new',    to: 'quizzes#create'
    
    resources :users do
        member do
            get :following, :followers
            get :self_destroy
            post :self_destroy
        end
    end
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]
    resources :microposts,          only: [:create, :destroy]
    resources :relationships,       only: [:create, :destroy]
    resources :verifications,       only: [:new, :create]
    resources :sites
    resources :quizzes
    resources :diaries
    resources :days
    resources :conversations do
        resources :messages
    end
    
    # Facebook login
    
    match 'auth/:provider/callback', to: 'sessions#create_fb', via: [:get, :post]
    match 'auth/failure', to: redirect('/'), via: [:get, :post]
    match 'signout', to: 'sessions#destroy_fb', as: 'signout', via: [:get, :post]
    #match 'insert_email', to: 'verifications#create_email', as: 'insert_email', via: [:get]
    
end
