class SubscriptionPacksController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @pack = Pack.all
        render json: @pack
    end

    def show
        @pack = Pack.find(params[:id])
        render json: @pack 
    end

    def create
        @pack = Pack.new(pack_param)
        if @pack.save
            render json: @pack, status: :created
        else
            render json: @pack.errors, status: :unprocessable_entity
        end
    end

    def update
        @pack = Pack.find(params[:id])
        if @pack.update(pack_param)
            render json: @pack
        else 
            render json: @pack.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @pack = Pack.find(params[:id])
        @pack.destroy
        render json: @pack
    end

    def pack_param
        params.require(:subscription_pack).permit(:name, :description, :price)
    end
end
