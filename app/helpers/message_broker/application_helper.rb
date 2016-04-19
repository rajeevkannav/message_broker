module MessageBroker
  module ApplicationHelper

    def model_methods_list
      Rails.application.eager_load!
      model_array = ActiveRecord::Base.subclasses.select do |subclass|
        subclass unless subclass.to_s.start_with? 'MessageBroker::'
      end - [ActiveRecord::SchemaMigration]
      Hash[model_array.map { |model| [model.to_s, model.applicable_methods.to_a] }]
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
