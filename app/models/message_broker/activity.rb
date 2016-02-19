module MessageBroker
  class Activity < ActiveRecord::Base
    # Validations
    validates_presence_of :name, :template_text
  end
end
