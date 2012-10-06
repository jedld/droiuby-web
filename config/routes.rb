DroiubyWeb::Application.routes.draw do
  get "resource/list"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => {:devise => 'devise'}

  get "home/index"
  get "droiuby" => "home#droiuby"
  get "app/new" => "app#new"
  get "app/config/:name" => "app#show", :as => 'config'
  post "app/create" => "app#create"
  get "app/info/:id" => "app#info", :as => 'app_info'
  get "app/show/:id" => "app#edit_show", :as => 'app_edit_show'
  put "app/update/:id" => "app#update", :as => 'app_update'
  get "service/:id/:resource_name" => "resource#show", :as => 'service_path'
  get "resource/:id" => "resource#list", :as => 'show_resource'
  get "resource/new/:id" => "resource#new", :as => "new_resource"
  get "resource/edit/:id" => "resource#show_for_update", :as => "edit_resource"
  post "resource/update/:id" => "resource#update", :as => 'update_resource'
  post "resource/create" => "resource#create"
  post "resource/destory/:id" => "resource#destroy", :as=>'destroy_resource'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
