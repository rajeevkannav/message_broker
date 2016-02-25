module MessageBroker
  class Rule < ActiveRecord::Base

    # Validations
    validates_presence_of :target, :event, :activity
    validates_presence_of :callback_duration, in: MessageBroker::CALLBACK_DURATION
    validates_presence_of :lapse_magnitude, in: MessageBroker::LAPSE_MAGNITUDE
    validates_presence_of :lapse_unit, in: MessageBroker::LAPSE_UNIT

    # Associations
    belongs_to :activity

  end
end
