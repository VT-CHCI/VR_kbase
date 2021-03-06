Kbase::Application.routes.draw do

  get "browse/index"

  mount Judge::Engine => '/judge'

  get "validate/papers"
  get "validate/categories"
  get "validate/components"
  get "validate/indy_variables"
  get "validate/metrics"
  get "validate/systems"
  get "validate/index"

  #devise_for :users
  devise_for :users, controllers: { registrations: "registrations" }

  #resources :indy_variables

  #resources :findings

  #resources :softwares

  #resources :hardwares

  #resources :displays

  #resources :venues

  resources :authors

  #resources :tasks

  resources :experiments

  resources :papers

  resources :users

  get '/landing', to: 'landing#index'
  get '/faq', to: 'landing#faq'

  #resources :finding_indy_variables

  #resources :finding_categories

  #resources :finding_system_apps

  #resources :finding_controls

  #resources :finding_biomechanicals

  #resources :finding_aurals

  #resources :finding_haptics

  #resources :finding_visuals

  #resources :user_authors

  #resources :user_papers

  #resources :experiment_indy_variables

  #resources :experiment_system_apps

  #resources :system_appropriatenesses

  #resources :experiment_controls

  #resources :control_symmetries

  #resources :experiment_biomechanicals

  #resources :biomechanical_symmetries

  #resources :experiment_aurals

  #resources :aural_fidelities

  #resources :experiment_haptics

  #resources :haptic_fidelities

  #resources :experiment_visuals

  #resources :visual_fidelities

  #resources :finding_specificities

  #resources :specificities

  #resources :finding_components

  #resources :finding_relationships

  #resources :relationships

  #resources :task_metrics

  #resources :metrics

  #resources :task_realisms

  #resources :realisms

  #resources :task_densities

  #resources :densities

  #resources :task_scales

  #resources :scales

  #resources :task_dimensions

  #resources :dimensions

  #resources :task_categories

  #resources :categories

  #resources :experiment_softwares

  #resources :experiment_hardwares

  #resources :experiment_displays

  #resources :experiment_genders

  #resources :genders

  #resources :author_papers

  #resources :paper_venues

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
  root :to => 'landing#index'

  get '/authors/:last_name/:first_name/:middle_initial', to: 'authors#search_name'
  get '/authors/:last_name/:first_name', to: 'authors#search_name'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
