class HealthRecord < ApplicationRecord
  belongs_to :animal
  belongs_to :booking
end
