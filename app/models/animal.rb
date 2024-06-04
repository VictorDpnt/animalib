class Animal < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many :health_records, dependent: :destroy
  validates :name, :specie, presence: true

  def age
    return unless birthdate

    now = Time.zone.now.to_date
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end
end
