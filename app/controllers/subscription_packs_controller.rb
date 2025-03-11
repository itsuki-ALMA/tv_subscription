class SubscriptionPacksController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def index
      @packs = Pack.all.includes(:additional_services)
      render json: @packs.as_json(include: { additional_services: { only: [:id, :name] } })
    end
  
    def show
      @pack = Pack.includes(:additional_services).find(params[:id])
      render json: @pack.as_json(include: { additional_services: { only: [:id, :name] } })
    end
  
    def create
      @pack = Pack.new(pack_param)
  
      ActiveRecord::Base.transaction do
        if @pack.save
          services = AdditionalService.where(id: service_params[:service_ids])
          @pack.additional_services << services
  
          render json: @pack, status: :created
        else
          render json: @pack.errors, status: :unprocessable_entity
        end
      end
    end
  
    def update
        @pack = Pack.find(params[:id])
        
        ActiveRecord::Base.transaction do
            if @pack.update(pack_param)
            # Buscar os novos serviços
            services = AdditionalService.where(id: service_params[:service_ids])
        
            # Substituir os serviços antigos pelos novos (remove o que não estiver mais e adiciona o novo)
            @pack.additional_services = services
        
            render json: @pack.as_json(include: { additional_services: { only: [:id, :name, :description, :price] } }), status: :ok
            else
            render json: @pack.errors, status: :unprocessable_entity
            end
        end
    end
      
  
    def destroy
      @pack = Pack.find(params[:id])
      @pack.destroy
      render json: @pack
    end
  
    private
  
    def pack_param
      params.require(:subscription_pack).permit(:name, :description, :price)
    end
  
    def service_params
      params.permit(service_ids: [])
    end
  end
  