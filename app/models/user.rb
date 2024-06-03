class User < ApplicationRecord
  has_many :animals
  has_many :bookings
  validates :first_name, :last_name, :email, :address, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email address" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
