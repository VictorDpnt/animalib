class Animal < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  has_many :health_records
  validates :name, :specie, presence: true
end
