require_dependency "message_broker/application_controller"

module MessageBroker
  class ActivitiesController < ApplicationController

    skip_before_filter :activity_comes_first, :only => [:new, :create]
    before_action :set_activity, only: [:show, :edit, :update, :destroy]
    before_action :get_activities, only: [:index, :destroy]

    # GET /activities
    def index
    end

    # GET /activities/1
    def show
      render text: @activity.template, layout: false if params[:preview_only]
    end

    # GET /activities/new
    def new
      @activity = Activity.new
    end

    # GET /activities/1/edit
    def edit
    end

    # POST /activities
    def create
      @activity = Activity.new(activity_params)

      if @activity.save
        redirect_to activities_path, notice: 'Activity was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /activities/1
    def update
      if @activity.update(activity_params)
        redirect_to activities_path, notice: 'Activity was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /activities/1
    def destroy
      @activity.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def get_activities
      @activities = Activity.all
    end

    # Only allow a trusted parameter "white list" through.
    def activity_params
      params.require(:activity).permit(
          :name, :subject, :template, :from, :to, :bcc, :cc
      )
    end


  end
end
