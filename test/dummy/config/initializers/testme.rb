Rails.application.eager_load!
ActiveRecord::Base.descendants.each do |descendant|
  descendant.send(:include, MessageBroker::Injector)
end
