class User < ActiveRecord::Base
	include AverageRating

	has_secure_password

  validates :username, uniqueness: true, length: { minimum: 3, maximum: 15 }
  validates :password, length: {minimum: 4}, format: {with: /.*[0-9].*/, message: " must contain atleast one number"}


	has_many :ratings, dependent: :destroy
	has_many :beers, through: :ratings

	def favourite_beer

		return nil if ratings.empty?
		ratings.order(score: :desc).limit(1).first.beer

	end
	def favourite_style

		return ni if ratings.empty?


	end

end
