MessageBroker::Engine.routes.draw do
  get 'rules/get_events'
  resources :rules

  get 'dashboard/dashboard'

  resources :activities
  root to: "dashboard#dashboard"
end
