require_dependency "message_broker/application_controller"

module MessageBroker
  class DashboardController < ApplicationController

    skip_before_filter :activity_comes_first

    def dashboard
    end

  end
end
