require_dependency "message_broker/application_controller"

module MessageBroker
  class RulesController < ApplicationController

    before_action :set_rule, only: [:edit, :destroy]
    before_action :get_rules, only: [:index, :create, :destroy]

    def index
      @rule = Rule.new
    end

    def create
      @rule = Rule.new(rule_params)
    end

    def edit
    end

    def destroy
      @rule.destroy
    end

    private

    # Only allow a trusted parameter "white list" through.
    def rule_params
      params.require(:rule).permit(:target, :event, :activity_id, :callback_duration, :lapse_magnitude, :lapse_unit)
    end

    def set_rule
      @rule = Rule.find params[:id]
    end

    def get_rules
      @rules = Rule.all
    end

  end
end
