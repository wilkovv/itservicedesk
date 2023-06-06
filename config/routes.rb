Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :servicemen, skip: [:registrations, :passwords, :confirmations, :omniauth_callbacks, :unlock, :invitations], controllers: {sessions: 'users/sessions'}
  devise_for :users, skip: [:registrations, :passwords, :confirmations, :omniauth_callbacks, :unlock, :invitations], controllers: {sessions: 'servicemen/sessions'}
  resources :issues
  get 'myissues', to: 'issues#myissues'
  get 'myissues/statistics', to: 'issues#mystats'
  #resources :servicemen
  #resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "issues#myissues"
end
