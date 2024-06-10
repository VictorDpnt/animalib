class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :date, presence: true
end
