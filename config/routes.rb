Rails.application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "user/omniauth_callbacks" }

  mount ActionCable.server => '/cable'
  
  root 'home#index'
  

  get 'help' => 'home#help'
  get 'mypage' => 'home#mypage'
  get 'enroll_mentor' => 'home#enroll_mentor'
  post 'enroll_process' => 'home#enroll_process'
  get 'admin' => 'home#admin'
  get 'service' => 'home#service'
  post 'admit' => 'home#admit'

  get 'mypage/apply_status'=>'home#apply_status'
  get 'mypage/checkout'=>'home#checkout'
  get 'mentoring'=>'home#mentoring'
  post 'mentor_select'=>'home#mentor_select'
  get 'remove_travel' => 'home#remove_travel'


  #mentoring related routing 
  
  get 'mentoring_apply' => 'mentoring#mentoring_apply_form_1'
  
  get '/mentoring_process1' => 'mentoring#mentoring_apply_form_2'
  post '/mentoring_process2' => 'mentoring#success'
  post '/mentoring_process3' => 'mentoring#matching1'
  
  get'mentor_view'=>'mentoring#mentor_view'
  get'mentor_viewdetail' =>'mentoring#mentor_viewdetail'
  get'mentor_view/reply_admit'=>'mentoring#reply_admit'
  get 'mentor_view/reply_admit2'=>'mentoring#reply_admit2'
  get 'mentor_view/reply_reject'=>'mentoring#reply_reject'
  get 'mentor_view/apply_success'=>'mentoring#reply_success'
  
  get 'auction' => 'mentoring#mentoring_auction'

  get 'mentoring_view' => 'mentoring#mentoring_view'


  # admin_ page 
  get 'admin_index' => 'home#admin_all'
  get 'admin_all' =>'home#admin_all'
  get 'admin_mentor' =>'home#admin_mentor'
  get 'admin_apply' =>'home#admin_apply'
  get 'admin_destroy' =>'home#admin_destroy'
  get 'down_grade'=>'home#down_grade'



  
  
  get 'mentor_view/show' =>'mentoring#show'

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
