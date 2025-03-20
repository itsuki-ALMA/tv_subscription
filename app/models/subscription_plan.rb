class SubscriptionPlan < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :price, presence: true

    has_many :signatures
end
