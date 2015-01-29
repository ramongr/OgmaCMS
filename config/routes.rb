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

      resources :events do
        member do
          put 'publish'
        end

        collection do
          put 'update_multiple'
        end
      end

      resources :links
      resources :users
      resources :system_mails, except: [:new,:delete]

      resources :attachments do
        member do
          get 'download'
        end
      end

      resources :newsletters do
        member do
          get 'send_newsletter'
        end
      end

      resources :galleries do
        member do
          put 'publish'
          post 'add_photo'
          post 'remove_photo'
          post 'reorder'
        end
      end

      resources :pages do
        member do
          put 'publish'
        end
      end

      resources :posts do
        member do
          put 'publish'
        end
      end

      resources :sidebars do
        member do
          put 'publish'
        end
      end

      resources :sliders do
        member do
          put 'publish'
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