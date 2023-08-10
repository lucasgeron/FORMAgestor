Rails.application.routes.draw do

  devise_for :admins, class_name: "App::Admin", controllers: { sessions: 'admins/sessions'}
  devise_for :users, class_name: "App::User", controllers: { sessions: 'users/sessions'}
  
  root to: "site#index", as: :site_root
  
  # - - - - - - - - - - ROUTES FOR SITE - - - - - - - - - - 

  get 'unsubscribe', to: 'app/subscribers#unsubscribe', as: :unsubscribe
  post '/toogle_locale', to: 'site#toogle_locale', as: :toogle_locale
  post '/contact_forms', to: 'site#contact_forms', as: :contact_forms

  # get '/:slug', to: 'app/prospects#new_by_slug'

  # - - - - - - - - - - ROUTES FOR APPLICATION - - - - - - - - - - 


  devise_scope :user do
    authenticated :user do
      root 'app/users#index', as: :user_authenticated_root
    end

    unauthenticated do
      namespace :app do
        root 'devise/sessions#new', as: :unauthenticated_root
      end
    end
  end

  devise_scope :admins do 
    authenticated :admin do
      root 'app/clients#index', as: :admin_authenticated_root
      
      # Exclusive routes in App namespace (just for admin)
      namespace :app do
        resources :admins, only: [:update]
        resources :clients do
          delete :destroy_attachment, on: :member
          get :search, on: :collection
        end
        resources :subscribers, only: [:index]
        resources :updates 
      end
    end
  end

  # Commom routes in App namespace
  namespace :app do
    resources :companies do
      get :search, on: :collection
    end

    resources :calendars do
      get :search, on: :collection
    end

    resources :courses do 
      get :search, on: :collection
    end
  
    resources :institutions do
        get :search, on: :collection
        delete :destroy_attachment, on: :member
    end
    
    resources :prospects do 
      get :search, on: :collection
    end
    resources :vendors do 
      get :search, on: :collection
    end

    resources :cities do 
      get :filter, on: :collection
      get :search, on: :collection
    end
    
    resources :users do
      get :search, on: :collection
    end
    resources :subscribers, only: [:create, :destroy]
    resources :updates, only: [:index, :show]
  end
  
end
