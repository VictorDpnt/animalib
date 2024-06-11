class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :date, presence: true

  REASONS = ["Follow-up consultation", "Vaccination", "Sterilization", "Digestive diseases", "Trauma", "Other"]
end
