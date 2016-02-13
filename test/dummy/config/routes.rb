Rails.application.routes.draw do

  mount MessageBroker::Engine => "/message_broker"
end
