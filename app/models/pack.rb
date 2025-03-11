class Pack < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
    validates :description, presence: true
    has_many :pack_services, dependent: :destroy
    has_many :additional_services, through: :pack_services
end
