require 'sidekiq/web'
Rails.application.routes.draw do

  mount MessageBroker::Engine => "/message_broker"
  mount Sidekiq::Web => '/sidekiq'
end
