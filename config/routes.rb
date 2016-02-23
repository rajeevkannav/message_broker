MessageBroker::Engine.routes.draw do
  resources :rules do
    member do
      post 'create'
    end
  end

  get  'dashboard/resource_events'
  root to: "dashboard#dashboard"
end
