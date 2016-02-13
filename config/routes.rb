MessageBroker::Engine.routes.draw do
  resources :activities
  root to: "activities#index"
end
