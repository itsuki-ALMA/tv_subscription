class AdditionalService < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :price, presence: true

    has_many :pack_services
    has_many :packs, through: :pack_services

    has_many :extra_services
    has_many :signatures, through: :extra_services

end
