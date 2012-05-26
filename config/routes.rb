Trunk::Application.routes.draw do
  root :to => 'user_sessions#login'
  
  match 'login' => "user_sessions#login",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  match 'tests_normal_show/:id' => "tests#tests_normal_show", :as => "tests_normal_show" ,:via => :get
  match'forgot_password'=>'signup#forgot_password',:as=> "forgot_password" ,:via =>[:get,:post]
  match'reset_password'=>'signup#reset_password',:as =>"reset_password" ,:via =>[:get,:post]
   match'graph'=>'samgruffs#index',:as=>"graph",:via=>:get
  match'report'=>'responses#report',:as=> "report" ,:via => :put
  match 'samgruffs/graph_code' => "samgruffs#graph_code", :via => :get
  match 'samgruffs/index' => "samgruffs#index", :via => :get
  resources :signup
  #resources :samgruffs
  resources :users
  resources :user_sessions
  resources :tests do
    resources :questions do
      resources :answers
    end
  end
  resources :categories

  resources :reponses

  
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
