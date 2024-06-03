class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  validates :date, :reason, presence: true
end
