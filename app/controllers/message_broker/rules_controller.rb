require_dependency "message_broker/application_controller"

module MessageBroker
  class RulesController < ApplicationController
    before_action :set_rule, only: [:show, :edit, :update, :destroy]

    # GET /rules
    def index
      @rules = Rule.all
    end

    # GET /rules/1
    def show
    end

    # GET /rules/new
    def new
      @rule = Rule.new
    end

    # GET /rules/1/edit
    def edit
    end

    # POST /rules
    def create
      @rule = Rule.new(rule_params)

      if @rule.save
        redirect_to @rule, notice: 'Rule was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /rules/1
    def update
      if @rule.update(rule_params)
        redirect_to @rule, notice: 'Rule was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /rules/1
    def destroy
      @rule.destroy
      redirect_to rules_url, notice: 'Rule was successfully destroyed.'
    end

    def get_events
      _klass_name = params[:ar_classname]
      @events = _klass_name.constantize.public_instance_methods(false)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_rule
      @rule = Rule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rule_params
      params.require(:rule).permit(:target, :event, :activity_id)
    end
  end
end
