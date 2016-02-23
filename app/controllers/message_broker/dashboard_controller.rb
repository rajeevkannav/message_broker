require_dependency "message_broker/application_controller"

module MessageBroker
  class DashboardController < ApplicationController

    def dashboard
      @rules = Rule.all
      @rule = Rule.new
      flash.now[:notice] = 'Rules not available.' if @rules.empty?
    end

    def resource_events
      _klass_name = params[:ar_classname]
      @events = _klass_name.constantize.public_instance_methods(false)
    end

  end
end
