Rails.application.routes.draw do

  root  "state_settings#show"
  post  ":uid/state_settings/toggle_lights", to: 'state_settings#toggle_lights', as: :toggle_lights
  post  ":uid/state_settings/toggle_sound",  to: 'state_settings#toggle_sound',  as: :toggle_sound
  get   "/lift_off",                         to: "state_settings#landing",       as: :landing_page
  post  "/lift_off/auth",                    to: "users#authenticate",           as: :authenticate_user

  get   "mission_control",                   to: "mission_settings#show",        as: :mission_setting
  get   "state_control",                     to: "state_settings#show",          as: :state_setting
  post  "mission_control",                   to: "mission_settings#update"
  patch "mission_control",                   to: "mission_settings#update"
  put   "mission_control",                   to: "mission_settings#update"

  get   "stats",                             to: "log_entries#show",             as: :stats

  # routes for highcharts to live update
  get   "recent_log_entries",                to: "log_entries#recent_log_entries"

  # API routes for pi to use
  get ":uid/state_settings",                to: "state_settings#state_settings"
  get ":uid/mission_settings",              to: "mission_settings#mission_settings"


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
