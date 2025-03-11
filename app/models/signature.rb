class Signature < ApplicationRecord
  belongs_to :user
  belongs_to :pack
  belongs_to :subscription_plan
  
  has_many :extra_services
  has_many :additional_services, through: :extra_services
end
