Todo::Application.routes.draw do
  resources :properties
  # resources :properties
  resources :specifications
  resources :amenities 
  resources :galleries 
  resources :floorplans
  resources :fronts  
  resources :contacts                                
   match '/sale' => 'properties#sale'
   match '/rent' => 'properties#rent' 
   match '/featured' => 'properties#featured' 
   match '/sold' => 'properties#sold' 
  match '/auth/failure' => 'authentications#failure' 
  match '/auth/:provider/callback' => 'authentications#create'  
  match '/showmyproperty', :controller => 'properties', :action => 'showmyproperty'
  match '/calender', :controller => 'properties', :action => 'calender'
  devise_for :users, :controllers => {:registrations => 'registrations'} 
  resources :users 
  resources :projects
  resources :tasks
  resources :authentications
  root :to => "fronts#show"
end
