class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  has_one :review, dependent: :destroy

  validates :date, presence: true

  REASONS = ["Follow-up consultation", "Vaccination", "Sterilization", "Digestive diseases", "Trauma", "Other"]
end
