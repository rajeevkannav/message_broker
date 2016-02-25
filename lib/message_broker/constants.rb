module MessageBroker
  CALLBACK_DURATION = [:before, :after]
  LAPSE_MAGNITUDE = 1...99
  LAPSE_UNIT = [:seconds, :hours, :days, :weeks, :fortnights, :months, :years]
  QUEUE_NAME = 'MessageBroker'
  RETRY_MAILS = true
end
