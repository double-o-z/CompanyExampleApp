Company::Application.routes.draw do

root to: 'home#home'


get '/employees/new_employee' => 'employees#new_employee'
post '/employees/new_employee' => 'employees#new_employee'
get '/employees/insert' => 'employees#insert'
post '/employees/insert' => 'employees#insert'

post '/insert_site_db' => 'positions#insert_site_db'
get '/user_insert_db' => 'positions#user_insert_db'
get '/positions/new_position' => 'positions#new_position'
post '/positions/new_position' => 'positions#new_position'
get '/positions/insert' => 'positions#insert'
post '/positions/insert' => 'positions#insert'

get '/employees/list' => 'employees#list'
get '/positions/list' => 'positions#list'

get '/employees/fire' => 'employees#fire'

get '/calcs/total' => 'calcs#total'
get '/calcs/month' => 'calcs#month'
get '/calcs/chart' => 'calcs#chart'
get '/calcs/fields' => 'calcs#fields'






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
