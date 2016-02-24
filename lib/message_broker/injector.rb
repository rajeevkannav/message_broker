module MessageBroker
  module Injector
    include ActiveSupport::Callbacks

    def self.included base
      base.extend ClassMethods
      base.send(:initialize_callback_watcher)
    end

    module ClassMethods

      def initialize_callback_watcher

        instance_methods(false).each do |im|

          define_model_callbacks im.to_sym # define all available callback methods

          ## define what need to done in callback action
          MessageBroker::CALLBACK_DURATION.each do |callback_t|
            define_method "#{callback_t}_#{im}" do |*args|

              Mail.defaults do
                delivery_method :smtp, address: "localhost", port: 1025
              end

              MessageBroker::Rule.where(target: self.class.to_s).where(event: im).where(callback_duration: callback_t).each do |mb_rule|
                Mail.delay_for(30.seconds).deliver do
                  from 'defaults@from.com'
                  to 'defaults@to.com'
                  subject 'default Subject'
                  body ERB.new(mb_rule.activity.template_text.to_s).result(instance_eval { binding })
                end
              end
            end
          end

          set_callback im.to_sym, :before, "before_#{im}".to_sym
          set_callback im.to_sym, :after, "after_#{im}".to_sym
          # FixME :check_if_possible set_callback im.to_sym, :around, "around_#{im}".to_sym

          send(:alias_method, "mb_#{im}", im) # aliased original method to message_broker instance method
          define_method "#{im}" do |*args|
            run_callbacks im.to_sym do
              puts self.inspect
              send("mb_#{im}", *args)
            end
          end


        end
      end
    end

  end
end


# self.instance_methods(false) + [:save, :create, :update, :destroy]

# base.class_eval do
#
# end
#
# base.instance_eval do
#
#   instance_methods(false).each do |instance_method_name|
#     class_eval do
#       define_model_callbacks instance_method_name.to_sym
#       before_"#{instance_method_name}" "message_broker_before_#{instance_method_name}".to_sym
#       after_"#{instance_method_name}" "message_broker_after_#{instance_method_name}".to_sym
#       around_"#{instance_method_name}" "message_broker_around_#{instance_method_name}".to_sym
#     end
#
#     define_method instance_method_name do
#       puts 'running callbacks ... sd'
#       run_callbacks instance_method_name.to_sym do |object|
#         puts 'running callbacks ... '
#       end
#       puts 'running callbacks ... ds'
#     end
#
#     [:before, :around ,:after].each do |callback_t|
#       define_method "message_broker_#{callback_t}_#{instance_method_name}" do |*args|
#         p "message_broker_#{callback_t}_#{instance_method_name}"
#       end
#
#     end
#   end
#
# end

# class Store
# end
# class CallbackTest
#   include ActiveSupport::Callbacks
#   define_callbacks :rajeev
#
#
#   set_callback :rajeev, :after do |object|
#     puts "=object -- #{object}="
#     puts "Saved"
#   end
#
#   def rajeev
#     puts "method rajeev"
#     run_callbacks :rajeev do
#       rajeev
#     end
#   end
# end

# cb = CallbackTest.new
# cb.rajeev


#   self.instance_methods(false).each do |instance_method|
#
#     self.define_model_callbacks instance_method.to_sym
#
#     p instance_method
#
#     define_method instance_method do
#       puts 'running callbacks ... sd'
#       run_callbacks instance_method_name.to_sym do |object|
#         puts 'running callbacks ... '
#       end
#       puts 'running callbacks ... ds'
#     end
#
#     [:before, :around, :after].each do |callback_t|
#       define_method "message_broker_#{callback_t}_#{instance_method}" do |*args|
#         p "message_broker_#{callback_t}_#{instance_method}"
#       end
#
#     end
#
#   end
#
#

