module MessageBroker
  module ApplicationHelper

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
