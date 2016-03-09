require_dependency "message_broker/application_controller"

module MessageBroker
  class DashboardController < ApplicationController

    def dashboard
      # @rules = Rule.all
      # @rule = Rule.new
    end

    def resource_events
      return [] if params[:ar_classname].nil?
      _klass = params[:ar_classname].constantize
      _methods_with_callback_and_aliased = _klass.public_instance_methods(false) - _klass.singleton_methods(false)
      _methods_with_aliased = _methods_with_callback_and_aliased.map { |method| method unless method.to_s.include? ('_callback') }.compact
      @events = _methods_with_aliased.map { |method| method unless method.to_s.include? ('message_broker_') }.compact
      @events
    end

  end
end
