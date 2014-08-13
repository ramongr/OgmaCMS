OgmaCMS::Application.routes.draw do

  mount Forem::Engine, :at => '/forum'

  devise_for :users, :controllers => { registrations: 'registrations' }

  get "static/index"

  root 'static#index'
  
  resources :calendar, only: [:index]
  resources :events, only: [:index,:show]
  resources :pages, only: [:show]
  resources :posts, only: [:index,:show] do
    resources :comments, shallow: true
  end
  resources :search, only: [:index]
  resources :visitor_comments
  
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
