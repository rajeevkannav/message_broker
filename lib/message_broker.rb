### Engine - External dependency
  ## To Ajax call UI
require 'jquery-rails'
  ## To Load AR classes and operate
require 'active_record'
  ## To email
require 'mail'
  ## To have delay and Queue to Messaging Server
require 'sidekiq'
### Engine level dependency
  ## define constants
require "message_broker/constants"
  ## access rails define_model_callbacks, set_callback
require 'active_support/callbacks'
  ## inject MessageBroker::Engine to accessing application
require "message_broker/injector"
  ## default
require "message_broker/engine"

module MessageBroker
end

