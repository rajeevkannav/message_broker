## MessageBroker - Auto-Pilot Mode for Rails 

respond to life cycle callbacks to implement trigger-like behavior. Simply drop-in the app and go!

## Installation

1. add to your `Gemfile` ->  `'message_broker'`.
    
    * For every model
        ##### Make a file message_broker.rb in Rails.root/config/initializers
        Rails.application.eager_load!
        ActiveRecord::Base.descendants.each do |descendant|
        descendant.send(:include, MessageBroker::Injector)
        end

    * For selective Models
        class ModelName < ActiveRecord::Base
            include MessageBroker::Injector
        end
2. add this line to routes `mount MessageBroker::Engine => "/message_broker"`
3. bundle install.
4. append your sidekiq.yml like this
    :queues:
      - default
      - [mailers, 2]
5. (Re-)boot application and `rails s`
6. Create some rules. checkout `/message_broker`
7. Create some activities checkout `/message_broker/activities`
8. Play safely(under-development)!



## Dependencies

  * "rails", "~> 4.2.5.1"
  * "jquery-rails", "~> 3.1.1"
  * "activerecord"
  * "sidekiq" # maybe
  * "mail" # maybe


## Contributing

We hope that you will consider contributing to MessageBroker. You can contribute in many ways. For example, you might:
 * add documentation and “how-to” articles to the README or Wiki.
 * improve the existing application with more system specific features in MessageBroker.

When contributing to MessageBroker, we ask that you to provide tests and documentation whenever possible.When fixing a bug, provide a failing test case that your patch solves. open a GitHub Pull Request with your patches and we will review your contribution and respond as quickly as possible.
Keep in mind that this is an open source project, and it may take us some time to get back to you. Your patience is
very much appreciated.

Soon you'll be listed here:
* [MessageBroker-people](https://github.com/rajeevkannav/message_broker)


This project rocks and uses MIT-LICENSE.
