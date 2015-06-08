Rails.application.routes.draw do
  # Routes for the Friend_request resource:
  # CREATE
  get "/friend_requests/new", :controller => "friend_requests", :action => "new"
  post "/create_friend_request", :controller => "friend_requests", :action => "create"

  # READ
  get "/friend_requests", :controller => "friend_requests", :action => "index"
  get "/friend_requests/:id", :controller => "friend_requests", :action => "show"

  # UPDATE
  get "/friend_requests/:id/edit", :controller => "friend_requests", :action => "edit"
  post "/update_friend_request/:id", :controller => "friend_requests", :action => "update"

  # DELETE
  get "/delete_friend_request/:id", :controller => "friend_requests", :action => "destroy"
  #------------------------------

  root 'statuses#index'

  # Routes for the Favorite resource:
  # CREATE
  get "/favorites/new", :controller => "favorites", :action => "new"
  post "/create_favorite", :controller => "favorites", :action => "create"

  # READ
  get "/favorites", :controller => "favorites", :action => "index"
  get "/favorites/:id", :controller => "favorites", :action => "show"

  # UPDATE
  get "/favorites/:id/edit", :controller => "favorites", :action => "edit"
  post "/update_favorite/:id", :controller => "favorites", :action => "update"

  # DELETE
  get "/delete_favorite/:id", :controller => "favorites", :action => "destroy"
  #------------------------------

  # Routes for the Brief resource:
  # CREATE
  get "/briefs/new", :controller => "briefs", :action => "new"
  post "/create_brief", :controller => "briefs", :action => "create"

  # READ
  get "/briefs", :controller => "briefs", :action => "index"
  get "/briefs/:id", :controller => "briefs", :action => "show"

  # UPDATE
  get "/briefs/:id/edit", :controller => "briefs", :action => "edit"
  post "/update_brief/:id", :controller => "briefs", :action => "update"

  # DELETE
  get "/delete_brief/:id", :controller => "briefs", :action => "destroy"
  #------------------------------

  # Routes for the Status resource:
  # CREATE
  get "/statuses/new", :controller => "statuses", :action => "new"
  post "/create_status", :controller => "statuses", :action => "create"

  # READ
  get "/statuses", :controller => "statuses", :action => "index"
  get "/statuses/:id", :controller => "statuses", :action => "show"

  # UPDATE
  get "/statuses/:id/edit", :controller => "statuses", :action => "edit"
  post "/update_status/:id", :controller => "statuses", :action => "update"

  # DELETE
  get "/delete_status/:id", :controller => "statuses", :action => "destroy"
  #------------------------------

  devise_for :users

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
