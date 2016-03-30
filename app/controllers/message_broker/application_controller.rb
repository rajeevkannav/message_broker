module MessageBroker
  class ApplicationController < ActionController::Base

    before_action :activity_comes_first

    private

    def activity_comes_first
      redirect_to new_activity_path, :flash => {:notice => "Let's create an activity first."} if Activity.count.zero?
    end
  end
end
