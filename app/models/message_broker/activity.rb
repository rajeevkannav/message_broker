module MessageBroker
  class Activity < ActiveRecord::Base

    # Saving arrays objects in text columns
    # serialize :to, Array
    # serialize :bcc, Array
    # serialize :cc, Array

    # Validations
    validates_presence_of :name, :to, :from, :subject, :template
    has_many :message_broker_rules, :class_name => 'MessageBroker::Rule', dependent: :destroy

    # before_save :test_run
    #
    # private
    # def test_run
    #   self.template = self.template.html_safe
    # end
  end
end
