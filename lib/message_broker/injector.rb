module MessageBroker
  module Injector
    def self.included base
      base.instance_eval { include ::Wisper.model }
      puts "subscribing model #{base}"
      base.instance_eval { subscribe(MessageBroker::Auditor.send :new) }
    end
  end
end



