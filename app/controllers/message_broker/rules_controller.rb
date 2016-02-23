require_dependency "message_broker/application_controller"

module MessageBroker
  class RulesController < ApplicationController

    before_action :set_rule, only: [:destroy]
    def create
      @rule = Rule.new(rule_params)
      redirect_to root_path unless @rule.save
    end

    def destroy
      @rule.destroy
    end

    private

    # Only allow a trusted parameter "white list" through.
    def rule_params
      params.require(:rule).permit(:target, :event, :activity_id)
    end

    def set_rule
      @rule = Rule.find params[:id]
    end

  end
end
