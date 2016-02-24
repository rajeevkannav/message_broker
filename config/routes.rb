MessageBroker::Engine.routes.draw do
  resources :rules
  resources :activities
  get 'dashboard/resource_events'
  root to: "dashboard#dashboard"
end
