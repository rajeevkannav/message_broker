module MessageBroker
  class Activity < ActiveRecord::Base

    # constants
    COMMA_SEPARATED_EMAILS = /(\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})(,\s*([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,}))*\z)/i

    # Validations
    validates :name, :subject, :template, :to, :from, presence: true
    validates :from, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "%{value} is not an email."}
    validates :to, format: {with: MessageBroker::Activity::COMMA_SEPARATED_EMAILS, message: "#{attr} must consist of valid email addresses only."}
    validates_each :cc, :bcc, allow_blank: true do |record, attr, value|
      record.errors.add attr, "must consist of valid email addresses only." unless value =~ MessageBroker::Activity::COMMA_SEPARATED_EMAILS
    end

    # Associations
    has_many :message_broker_rules, :class_name => 'MessageBroker::Rule', dependent: :destroy
  end
end
