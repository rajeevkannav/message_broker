MessageBroker::Engine.routes.draw do
  get 'dashboard/dashboard'

  resources :activities
  root to: "dashboard#dashboard"
end
