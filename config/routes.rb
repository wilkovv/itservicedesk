Rails.application.routes.draw do
  devise_for :servicemen, skip: [:registrations, :passwords, :confirmations, :omniauth_callbacks, :unlock, :invitations]
  devise_for :users, skip: [:registrations, :passwords, :confirmations, :omniauth_callbacks, :unlock, :invitations]
  resources :issues
  get 'myissues', to: 'issues#myissues'
  #resources :servicemen
  #resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "issues#myissues"
end
