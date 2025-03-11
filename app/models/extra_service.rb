class ExtraService < ApplicationRecord
  belongs_to :signature
  belongs_to :additional_service
end
