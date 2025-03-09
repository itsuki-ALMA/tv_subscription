class SubscriptionPlansController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @plan = SubscriptionPlan.all
        render json: @plan
    end

    def show
        @plan = SubscriptionPlan.find(params[:id])
        render json: @plan
    end

    def create
        @plan = SubscriptionPlan.new(subscription_plan_params)
        if @plan.save
            render json: @plan, status: :created
        else
            render json: @plan, status: :unprocessable_entity
        end
    end

    def update
        @plan = SubscriptionPlan.find(params[:id])
        if @plan.update(subscription_plan_params)
            render json: @plan
        else
            render json: @plan.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @plan = SubscriptionPlan.find(params[:id])
        @plan.destroy
        head :no_content
    end

    private

    def subscription_plan_params
        params.require(:subscription_plan).permit(:name, :price)
    end

end
