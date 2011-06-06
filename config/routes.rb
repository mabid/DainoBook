Facebook::Application.routes.draw do |map|

  resources :users, :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => "pages#index"
  map.user_root 'userhome', :controller => 'users', :action => 'home'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end
