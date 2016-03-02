module MessageBroker
  module Injector
    include ActiveSupport::Callbacks

    def self.included base

      base.class_eval do
        instance_methods(false).each do |im|

          define_model_callbacks im.to_sym # define all available callback methods

          set_callback im.to_sym, :before do
            message_broker_adjustments(im, :before)
          end

          set_callback im.to_sym, :after do
            message_broker_adjustments(im, :after)
          end

          alias_method "message_broker_#{im}", im

          define_method "#{im}" do |*args|
            run_callbacks im.to_sym do
              send("message_broker_#{im}", *args)
            end
          end

        end
      end

    end

    def message_broker_adjustments(event, callback_t)
      MessageBroker::Rule.where(target: self.class.to_s).where(event: event).where(callback_duration: callback_t).each do |mb_rule|
        puts "mb_rule #{mb_rule.inspect}"
      end
    end

  end
end

