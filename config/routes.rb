MessageBroker::Engine.routes.draw do
  resources :rules
  # resources :rules do
  #   member do
  #     delete 'destroy'
  #     post 'create'
  #   end
  # end

  get  'dashboard/resource_events'
  root to: "dashboard#dashboard"
end
