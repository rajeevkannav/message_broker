module MessageBroker
  class Rule < ActiveRecord::Base

    # constants
    CALLBACK_DURATION = %w(before after)
    LAPSE_MAGNITUDE = 0...99
    LAPSE_UNIT = %w(seconds hours days weeks fortnights months years)

    # Validations
    validates :target, :event, :activity, :callback_duration, :lapse_magnitude, :lapse_unit, presence: true
    validates_inclusion_of :callback_duration, in: MessageBroker::Rule::CALLBACK_DURATION, message: "value %{value} is not included in the list"
    validates_inclusion_of :lapse_magnitude, in: MessageBroker::Rule::LAPSE_MAGNITUDE, message: "value %{value} is not included in the list"
    validates_inclusion_of :lapse_unit, in: MessageBroker::Rule::LAPSE_UNIT, message: "value %{value} is not included in the list"

    # Associations
    belongs_to :activity

  end
end
