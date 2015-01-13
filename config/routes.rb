OgmaCMS::Application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, at: '/forum'

  scope '(:locale)', locale: /[a-zA-Z]{2}/ do
    devise_for :users, controllers: { registrations: 'registrations' }

    devise_scope :user do
      get 'registrations/unsubscribe', to: 'registrations#unsubscribe'
    end

    get 'static/index'
    root 'static#index'

    resources :calendar, only: :index    

    resources :events, only: [:index, :show] do
      put 'going' => 'events#going', as: 'going'
      put 'not_going' => 'events#not_going', as: 'not_going'
      put 'maybe' => 'events#maybe', as: 'maybe'
      put 'notify' => 'events#notify', as: 'notify'
    end
    
    resources :pages, only: [:index, :show]

    post 'posts/unpublished', to: 'posts#unpublished', as: :unpublished
    resources :posts, only: [:index, :show] do
      resources :comments, shallow: true
      post 'toggle_read'
      put 'publish'
    end

    resources :search, only: :index
    resources :visitor_comments, except: :show

    resources :attachments, only: [] do
      member do
        get 'download'
      end
    end

    resources :galleries, only: [:index, :show]

    # User roots
    namespace :admin do
      get '/', to: 'dashboard#index'
      
      resources :links
      resources :users
      resources :system_mails, except: [:new,:delete]

      resources :attachments do
        member do
          get 'download'
        end
      end

      resources :events do
        put 'publish' => 'events#publish', as: 'publish'
      end

      resources :newsletters do
        member do
          get 'send_newsletter'
        end
      end

      resources :galleries do
        put 'publish' => 'galleries#publish', as: 'publish'
        member do
          post 'add_photo'
          post 'remove_photo'
          post 'reorder'
        end
      end

      resources :pages do
        put 'publish' => 'pages#publish', as: 'publish'
      end

      resources :posts do
        put 'publish' => 'posts#publish', as: 'publish'
      end

      resources :sidebars do
        put 'publish' => 'sidebars#publish', as: 'publish'
      end

      resources :sliders do
        put 'publish' => 'sliders#publish', as: 'publish'
        member do
          post 'add_photo'
          post 'remove_photo'
          post 'reorder'
        end
      end      

      resources :settings, only: [:index]
      put 'settings_update', to: 'settings#update_all'
    end
  end

end
