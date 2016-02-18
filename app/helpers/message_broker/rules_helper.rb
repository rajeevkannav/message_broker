module MessageBroker
  module RulesHelper

    def model_list
      # []
      ActiveRecord::Base.descendants.map {|model| [model]}
    end
  end
end
