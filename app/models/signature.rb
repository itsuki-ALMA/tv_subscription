class Signature < ApplicationRecord
  belongs_to :user
  belongs_to :pack, optional: true # Se o pacote não for obrigatório
  belongs_to :subscription_plan, optional: true # Se o plano não for obrigatório
  
  has_many :extra_services, dependent: :destroy
  has_many :additional_services, through: :extra_services

  # Calcular o valor total da assinatura, incluindo o preço do pacote ou plano e os serviços adicionais
  def total_value
    base_price = pack&.price || subscription_plan&.price || 0
    additional_services_price = additional_services.sum(:price)
    base_price + additional_services_price
  end
end
