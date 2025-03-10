class AdditionalService < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :price, presence: true
end
