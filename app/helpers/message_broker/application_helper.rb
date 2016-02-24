module MessageBroker
  module ApplicationHelper

    def model_list
      Rails.application.eager_load!
      _list = (ActiveRecord::Base.subclasses.map { |subclass| subclass.to_s unless subclass.to_s.include? 'MessageBroker::' } - [ActiveRecord::SchemaMigration]).compact!
      _list - ['ActiveRecord::SchemaMigration']
    end

    def link_material_icon_to(link, icon_name, text = nil)
      link_to link do
        if text.nil?
          "#{content_tag :i, icon_name, class: "material-icons w3-xxlarge" }".html_safe
        else
          "#{content_tag :i, icon_name, class: "material-icons w3-xxlarge" } #{text}".html_safe
        end
      end
    end
  end
end
