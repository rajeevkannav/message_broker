module MessageBroker
  module RulesHelper

    def model_list
      Rails.application.eager_load!
      _list = (ActiveRecord::Base.subclasses.map { |subclass| subclass.to_s unless subclass.to_s.include? 'MessageBroker::' } - [ActiveRecord::SchemaMigration]).compact!
      _list - ['ActiveRecord::SchemaMigration']
    end
  end
end
