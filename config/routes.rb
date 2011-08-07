Todo::Application.routes.draw do
  resources :books

  match '/auth/:provider/callback' => 'authentications#create'
  devise_for :users, :controllers => {:registrations => 'registrations'}
  resources :projects
  resources :tasks
  resources :authentications
  root :to => "books#index"
end
