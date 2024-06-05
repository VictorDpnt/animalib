class User < ApplicationRecord
  PROFESSION = ["Veterinarian", "Pets-Sitter", "Groomer"]
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  has_many :animals, dependent: :destroy
  has_many :bookings_for_animal, through: :animals, source: :bookings

  has_many :bookings, dependent: :destroy

  validates :first_name, :last_name, :email, :address, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email address" }


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
