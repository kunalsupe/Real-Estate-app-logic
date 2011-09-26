Todo::Application.routes.draw do
  resources :properties
  resources :specifications
  resources :amenities 
  resources :galleries 
  resources :floorplans
  resources :front
  match '/auth/failure' => 'authentications#failure' 
  match '/auth/:provider/callback' => 'authentications#create'  
  match '/showmyproperty', :controller => 'properties', :action => 'showmyproperty'
  match '/calender', :controller => 'properties', :action => 'calender'
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :projects
  resources :tasks
  resources :authentications
  root :to => "front#show"
end
