module MessageBroker
  class Rule < ActiveRecord::Base
    belongs_to :activity
  end
end
