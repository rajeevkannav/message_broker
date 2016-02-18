module MessageBroker
  module RulesHelper

    def model_list
      ActiveRecord::Base.descendants.map {|model| [model] unless model.to_s.include? 'MessageBroker::'}
    end
  end
end
