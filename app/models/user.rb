class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :age, presence: true, numericality: { greater_than_or_equal_to: 18, message: "deve ser maior ou igual a 18 anos" }
end
