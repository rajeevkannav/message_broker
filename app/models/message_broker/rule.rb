module MessageBroker
  class Rule < ActiveRecord::Base

    # Validations
    validates :target, :event, :activity, :callback_duration, :lapse_magnitude, :lapse_unit, presence: true
    validates_inclusion_of :callback_duration, in: MessageBroker::CALLBACK_DURATION, message: "extension %{value} is not included in the list"
    validates_inclusion_of :lapse_magnitude, in: MessageBroker::LAPSE_MAGNITUDE, message: "extension %{value} is not included in the list"
    validates_inclusion_of :lapse_unit, in: MessageBroker::LAPSE_UNIT, message: "extension %{value} is not included in the list"

    # Associations
    belongs_to :activity

  end
end
