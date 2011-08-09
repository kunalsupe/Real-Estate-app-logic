Todo::Application.routes.draw do
  resources :books
  match '/auth/failure' => 'authentications#failure' 
  match '/auth/:provider/callback' => 'authentications#create'  
  match '/showmybook', :controller => 'books', :action => 'showmybook'
  match '/calender', :controller => 'books', :action => 'calender'
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :projects
  resources :tasks
  resources :authentications
  root :to => "books#index"
end
