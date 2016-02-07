module AverageRating
	def average_rating

		return ratings.average(:score).round(1)

	end


end