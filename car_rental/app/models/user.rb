class User < ApplicationRecord
  has_many :favourites
  has_many :cars, through: :favourites, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :reviews

  validates :user_name, presence: true, length: {minimum: 3, maximum: 25}, uniqueness: {case_sensitive: false}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
						uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 50},
						format: {with: VALID_EMAIL_REGEX}
	has_secure_password

  validates :age, presence: true, numericality: {greater_than: 17 }
  validates :name, presence: true, length: {maximum: 25, minimum: 3}
  validates :address, presence: true, length: { minimum: 5}
  validates :points, numericality: {greater_than: -1 }
end
