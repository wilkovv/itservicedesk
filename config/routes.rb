Rails.application.routes.draw do
  devise_for :servicemen
  devise_for :users
  resources :issues
  get 'myissues', to: 'issues#myissues'
  #resources :servicemen
  #resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "issues#myissues"
end
