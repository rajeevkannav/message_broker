MessageBroker::Engine.routes.draw do
  resources :rules
  get 'dashboard/dashboard'

  resources :activities
  root to: "dashboard#dashboard"
end
