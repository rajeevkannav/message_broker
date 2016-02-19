module MessageBroker
  class Rule < ActiveRecord::Base
    # Validations
    validates_presence_of :target, :event, :activity
    # Associations
    belongs_to :activity

  end
end
