### Engine - External dependency
require 'rails'
require 'active_record'
require 'action_mailer'
require 'jquery-rails' ## To Ajax call UI
require 'bootstrap-sass'
require 'sidekiq' ## To have delay and Queue to Messaging Server

### Engine level dependency

require 'active_support/callbacks' ## access rails define_model_callbacks, set_callback
require "message_broker/injector" ## inject MessageBroker::Engine to accessing application
require "message_broker/engine"

module MessageBroker
end

