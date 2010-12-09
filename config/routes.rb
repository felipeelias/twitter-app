TwitterApp::Application.routes.draw do
  root :to => 'sessions#new'
  get '/auth/twitter/callback', :to => 'sessions#create', :as => :callback
  get '/auth/failure', :to => 'sessions#error', :as => :error
  delete '/signout', :to => 'sessions#destroy', :as => :signout
end
