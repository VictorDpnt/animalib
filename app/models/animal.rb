class Animal < ApplicationRecord
  belongs_to :user
  has_many :health_records
  validates :name, :specie, presence: true
end
