module MessageBroker
  module ApplicationHelper

    #Fixme : Poor Code.
    def model_list
      Rails.application.eager_load!
      _models = (ActiveRecord::Base.subclasses.map { |subclass| subclass.to_s unless subclass.to_s.include? 'MessageBroker::' } - [ActiveRecord::SchemaMigration]).compact!
      model_methods_pairs = {}
      (_models - ['ActiveRecord::SchemaMigration']).each do |model|
        model_methods_pairs.deep_merge!({model.to_sym => instance_methods_list(model)})
      end
      model_methods_pairs
    end

    #Fixme : Poor Code.
    def instance_methods_list(model_name)
      _klass = model_name.safe_constantize
      _methods = []
      unless _klass.nil?
        _methods_with_callback_and_aliased = _klass.public_instance_methods(false) - _klass.singleton_methods(false)
        _methods_with_aliased = _methods_with_callback_and_aliased.map { |method| method unless method.to_s.include? ('_callback') }.compact
        _methods = _methods_with_aliased.map { |method| method unless method.to_s.include? ('message_broker_') }.compact
      end
      _methods
    end

    def active_class(link_path)
      current_page?(link_path) ? 'active' : ''
    end

    def bootstrap_class_for flash_type
      case flash_type.to_sym
        when :notice
          'alert-info'
        when :success
          'alert-success'
        when :error
          'alert-danger'
        when :alert
          "alert-warning"
        else
          flash_type.to_s
      end
    end


  end
end
