Facebook::Application.routes.draw do |map|

	resources :users do
		map.user_photos 'user_photos', :controller => 'albums', :action => 'index'
		resources :friends
		resources :albums do
			resources :photos
		end
	end

	resources :user_sessions
  resources :user_sessions
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => "pages#index"
  map.user_root 'userhome', :controller => 'users', :action => 'home'

  map.basic_info 'basic_info', :controller => 'users', :action => 'basic_info'
  map.activities_interests 'activities_interests', :controller => 'users', :action => 'activities_interests'
  map.contact_info 'contact_info', :controller => 'users', :action => 'contact_info'
  map.education_work 'education_work', :controller => 'users', :action => 'education_work'
  map.sports 'sports', :controller => 'users', :action => 'sports'
  map.edit_profile 'edit_profile', :controller => 'users', :action => 'edit_profile'
  map.profile_pic 'profile_pic', :controller => 'users', :action => 'profile_pic'
  map.invite_friends 'invite_friends', :controller => 'import_contacts', :action => 'invite_friends'

	map.import_google '/import/google',   :controller => "import_contacts", :action => 'import_google_contacts'
	map.import_live   '/import/live',     :controller => "import_contacts", :action => 'import_live_contacts'
	map.import_yahoo  '/import/yahoo',    :controller => "import_contacts", :action => 'import_yahoo_contacts'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end
