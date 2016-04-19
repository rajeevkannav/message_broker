module MessageBroker
  class Rule < ActiveRecord::Base

    # constants
    CALLBACK_TYPE = %w(before after)
    LAPSE_MAGNITUDE = 0...99
    LAPSE_UNIT = %w(seconds hours days weeks fortnights months years)

    # Validations
    validates :target, :event, :activity, :callback_duration, :lapse_magnitude, :lapse_unit, presence: true
    validates :callback_duration, inclusion: {in: MessageBroker::Rule::CALLBACK_TYPE, message: "value %{value} is not included in the list"}
    validates :lapse_magnitude, inclusion: {in: MessageBroker::Rule::LAPSE_MAGNITUDE, message: "value %{value} is not included in the list"}
    validates :lapse_unit, inclusion: {in: MessageBroker::Rule::LAPSE_UNIT, message: "value %{value} is not included in the list"}

    # Associations
    belongs_to :activity

  end
end

### Todo: CALLBACK_DURATION Rename ??
### Todo: Application Helper RE-write
### Todo: instance_method_list should be validated.
### Todo: Write How it works?



