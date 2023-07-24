Rails.application.routes.draw do
  
  root to: "site#index"

  post '/toogle_locale', to: 'site#toogle_locale', as: :toogle_locale
  post "/subscribe", to: 'site#subscribe_to_newsletter', as: :subscribe
  get "/unsubscribe", to: 'site#unsubscribe_confirm', as: :unsubscribe_confirm
  post "/unsubscribe", to: 'site#unsubscribe_to_newsletter', as: :unsubscribe
  post "/contact_forms", to: 'site#contact_forms', as: :contact_forms

  # - - - - - - - - - - ROUTES FOR APPLICATION - - - - - - - - - - 

  devise_for :users, controllers: { sessions: 'users/sessions'}
  devise_for :admins, controllers: { sessions: 'admins/sessions'}

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
        resources :clients
      end
    end
  end

  # Commom routes in App namespace
  namespace :app do
    resources :users
  end


end
