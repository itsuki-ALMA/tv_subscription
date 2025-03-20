class SignaturesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # Listar todas as assinaturas
  def index
    @signatures = Signature.includes(:additional_services, :pack, :subscription_plan)
    render json: @signatures.as_json(include: {
      pack: { only: [:id, :name, :description, :price] },
      subscription_plan: { only: [:id, :name, :price] },
      additional_services: { only: [:id, :name, :price] }
    }, methods: :total_value)
  end

  # Mostrar uma assinatura específica
  def show
    @signature = Signature.includes(:additional_services, :pack, :subscription_plan).find(params[:id])
    render json: @signature.as_json(include: {
      pack: { only: [:id, :name, :description, :price] },
      subscription_plan: { only: [:id, :name, :price] },
      additional_services: { only: [:id, :name, :price] }
    }, methods: :total_value)
  end

  # Criar uma nova assinatura
  def create
    @signature = Signature.new(signature_params)

    pack_id = signature_params[:pack_id]
    subscription_plan_id = signature_params[:subscription_plan_id]
    additional_service_ids = service_params[:service_ids] || []

    # Validação: deve escolher pack OU plano, nunca ambos ou nenhum
    if (pack_id.present? && subscription_plan_id.present?) || (pack_id.blank? && subscription_plan_id.blank?)
      return render json: { error: 'Você deve escolher apenas um: pacote ou plano.' }, status: :unprocessable_entity
    end

    # Se pack_id estiver ausente, use subscription_plan_id
    if pack_id.blank? && subscription_plan_id.blank?
      return render json: { error: 'Você deve fornecer um pacote ou um plano.' }, status: :unprocessable_entity
    end

    # Se pack_id não for fornecido, ele deve ser nulo no banco
    if pack_id.blank?
      @signature.pack_id = nil
    end

    ActiveRecord::Base.transaction do
      if @signature.save
        # Lógica para filtrar serviços adicionais se for pack
        filtered_service_ids = if pack_id.present?
          pack = Pack.find(pack_id)
          pack_services_ids = pack.additional_services.pluck(:id)
          additional_service_ids.map(&:to_i) - pack_services_ids
        else
          additional_service_ids.map(&:to_i)
        end

        # Criar extra_services
        filtered_service_ids.each do |service_id|
          if AdditionalService.exists?(service_id)
            @signature.extra_services.create!(additional_service_id: service_id)
          end
        end

        render json: @signature.as_json(include: {
          pack: { only: [:id, :name, :description, :price] },
          subscription_plan: { only: [:id, :name, :price] },
          additional_services: { only: [:id, :name, :price] }
        }, methods: :total_value), status: :created
      else
        render json: @signature.errors, status: :unprocessable_entity
      end
    end
  end

  # Excluir assinatura
  def destroy
    begin
      @signature = Signature.find(params[:id])
      @signature.destroy
      render json: { message: 'Assinatura excluída com sucesso.' }
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Assinatura não encontrada.' }, status: :not_found
    end
  end

  private

  # Permitir parâmetros principais da assinatura
  def signature_params
    params.require(:signature).permit(:user_id, :pack_id, :subscription_plan_id)
  end

  # Permitir array de serviços adicionais
  def service_params
    params.require(:signature).permit(service_ids: [])
  end
end
