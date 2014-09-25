OgmaCMS::Application.routes.draw do

  mount Forem::Engine, :at => '/forum'

  scope '(:locale)', locale: /[a-zA-Z]{2}/ do
    devise_for :users, :controllers => { registrations: 'registrations' }

    devise_scope :user do
      get 'registrations/unsubscribe', to: 'registrations#unsubscribe'
    end

    get "static/index"

    root 'static#index'
    
    resources :calendar, only: :index
    resources :static_pages, only: [:index,:show]
    resources :events, only: [:index,:show] do
      put 'going' => 'events#going', as: 'going'
      put 'not_going' => 'events#not_going', as: 'not_going'
      put 'maybe' => 'events#maybe', as: 'maybe'
    end

    resources :posts, only: [:index,:show] do
      resources :comments, shallow: true
    end
    resources :search, only: :index
    resources :visitor_comments, except: :show
    resources :attachments, only: [] do
      member do
        get 'download'
      end
    end   

    resources :galleries, only: [:index,:show]

    
    # User roots
    namespace :admin do
      get '/', to: 'dashboard#index'
      resources :sidebars
      resources :static_pages
      resources :posts
      resources :links
      resources :users
      resources :events
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
         post 'add_photo'
         post 'remove_photo'
         post 'reorder'       
        end
      end
      resources :sliders do
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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end