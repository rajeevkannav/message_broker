# module MessageBroker
#   class Auditor
#
#     CB_POINTS = [:before, :around, :after]
#
#     def self.audit
#       puts '======== audit called ========'
#       puts '======== audit called ========'
#       Rails.application.eager_load!
#       app_models = _list = (ActiveRecord::Base.subclasses.map { |subclass| subclass.to_s unless subclass.to_s.include? 'MessageBroker::' } - [ActiveRecord::SchemaMigration]).compact!
#       app_models = _list - ['ActiveRecord::SchemaMigration']
#       app_models.each do |model|
#         puts model.inspect
#       end
#     end
#   end
#
#   # Auditor.audit
#
# end
