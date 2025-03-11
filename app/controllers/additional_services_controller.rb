class AdditionalServicesController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        @services = AdditionalService.all
        render json: @services
    end

    def show
        @service = AdditionalService.find(params[:id])
        render json: @service
    end

    def create
        @service = AdditionalService.new(service_params)
        if @service.save
            render json: @service, status: :created
        else
            render json: @service.errors, status: :unprocessable_entity
        end
    end

    def update
        @service = AdditionalService.find(params[:id])
        if @service.update(service_params)
            render json: @service
        else
            render json: { error: "Serviço não encontrado ou falha ao atualizar" }, status: :unprocessable_entity
        end
    end

    def destroy
        @service = AdditionalService.find(params[:id])
        @service.destroy
        head :no_content
    end

    private

    def service_params
        params.require(:additional_service).permit(:name, :price)
    end
end
