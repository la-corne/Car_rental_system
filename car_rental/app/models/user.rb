class User < ApplicationRecord
	has_many :favourites
	has_many :rentals
	has_many :reviews
end
