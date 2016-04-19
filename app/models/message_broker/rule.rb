module MessageBroker
  class Rule < ActiveRecord::Base

    # constants
    CALLBACK_TYPE = %w(before after)
    LAPSE_MAGNITUDE = 0...99
    LAPSE_UNIT = %w(seconds hours days weeks fortnights months years)

    # Validations
    validates :target, :event, :activity, :callback_type, :lapse_magnitude, :lapse_unit, presence: true
    validates :callback_type, inclusion: {in: MessageBroker::Rule::CALLBACK_TYPE, message: "value %{value} is not included in the list"}
    validates :lapse_magnitude, inclusion: {in: MessageBroker::Rule::LAPSE_MAGNITUDE, message: "value %{value} is not included in the list"}
    validates :lapse_unit, inclusion: {in: MessageBroker::Rule::LAPSE_UNIT, message: "value %{value} is not included in the list"}
    #Fixme: validates :event, inclusion: {in: Proc.new {|rule| rule.applicable_methods.to_a}}

    # Associations
    belongs_to :activity
  end
end



